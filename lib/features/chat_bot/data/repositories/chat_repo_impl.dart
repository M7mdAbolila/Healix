import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../../core/helpers/logging.dart';
import '../../../../core/constants/prompt_constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/observation.dart';
import '../../domain/repositories/chat_repo.dart';
import '../datasources/chat_api_service.dart';
import '../models/requests/send_message_request.dart';
import '../models/responses/chat_response.dart';

class ChatRepoImpl implements ChatRepo {
  final ChatApiService _apiService;

  ChatRepoImpl(this._apiService);

  @override
  Future<Either<ApiErrorModel, Message>> sendMessage({
    required String userInput,
    required List<Message> conversationHistory,
    List<String>? images,
  }) async {
    try {
      final List<Content> contents = [];

      /// Add the prompt
      contents.add(Content(
        role: "user",
        parts: [
          Part(text: PromptConstants.chatPrompt),
        ],
      ));
      Logging.info(
          'Prompt added to contents: ${PromptConstants.chatPrompt.substring(0, 50)}...');

      /// Add the conversation history
      for (var message in conversationHistory) {
        final parts = <Part>[];
        if (message.message.isNotEmpty) {
          parts.add(Part(text: message.message));
          Logging.info('Message added to contents: ${message.message}');
        }
        if (message.images != null && message.images!.isNotEmpty) {
          for (final image in message.images!) {
            parts.add(Part(
              inlineData: InlineData(
                mimeType: "image/jpeg",
                data: image,
              ),
            ));
          }
        }
        contents.add(Content(
          role: message.isUser ? "user" : "model",
          parts: parts,
        ));
      }
      Logging.info(
          'Conversation history added to contents: ${contents.length} messages');

      /// Add the language instruction and the current user input
      contents.add(Content(
        role: "user",
        parts: [
          Part(
              text:
                  'System: The current user message is in ${userInput.contains(RegExp(r'[a-zA-Z]')) ? 'English' : 'Arabic'}. Respond in ${userInput.contains(RegExp(r'[a-zA-Z]')) ? 'English' : 'Arabic'}.'),
          if (userInput.isNotEmpty) Part(text: userInput),
          if (images != null && images.isNotEmpty)
            ...images.map(
              (image) => Part(
                inlineData: InlineData(
                  mimeType: "image/jpeg",
                  data: image,
                ),
              ),
            ),
        ],
      ));
      Logging.info(
          'User input and language instruction added: User input: $userInput');

      /// Prepare the request and call the API
      final request = SendMessageRequest(
        contents: contents,
        generationConfig: GenerationConfig(
          temperature: 0.7,
          topP: 0.95,
          maxOutputTokens: 1024,
        ),
      );
      final requestString = request.toString();
      Logging.info(
          'API request prepared: ${requestString.length > 100 ? '${requestString.substring(0, 100)}...' : requestString}');

      final apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
      if (apiKey.isEmpty) {
        Logging.error('API Key not found');
        return left(ApiErrorModel(errMessage: "API Key not found"));
      }
      final response = await _apiService.sendMessage(request, apiKey);
      final responseString = response.toString();
      Logging.info(
          'API response received: ${responseString.length > 200 ? '${responseString.substring(0, 200)}...' : responseString}');

      /// Parse the response
      final botReply = response.candidates[0].content.parts[0].text;
      Logging.info('Raw bot reply: $botReply');
      String cleanedReply = botReply.trim();

      /// Check if the response is wrapped in code blocks
      if (cleanedReply.startsWith('```json') && cleanedReply.endsWith('```')) {
        cleanedReply = cleanedReply.replaceFirst('```json', '').trim();
        cleanedReply =
            cleanedReply.substring(0, cleanedReply.length - 3).trim();
        Logging.info(
            'Cleaned reply (after removing ```json```): $cleanedReply');
      } else {
        /// If the response is not a JSON object, return an error message
        Logging.warn(
            'Response not wrapped in ```json```, returning error message');
        return right(Message(
          isUser: false,
          message:
              "Error: The API response was not in the expected JSON format. Please try again.",
          date: DateTime.now(),
          hasObservations: false,
        ));
      }

      /// Try parsing the cleaned response as JSON
      final jsonData = jsonDecode(cleanedReply);
      Logging.info('Parsed JSON data: $jsonData');
      if (jsonData is! Map<String, dynamic>) {
        Logging.warn('Invalid JSON format detected');
        return right(Message(
          isUser: false,
          message:
              "Error: The API response was not a valid JSON object. Please try again.",
          date: DateTime.now(),
          hasObservations: false,
        ));
      }

      final chatResponse = ChatResponse.fromJson(jsonData);
      final message = Message(
        isUser: false,
        message: chatResponse.text,
        date: DateTime.now(),
        options: chatResponse.options.isNotEmpty ? chatResponse.options : null,
        hasObservations: chatResponse.observations.isNotEmpty,
        observations: chatResponse.observations.isNotEmpty
            ? chatResponse.observations
                .map((obs) => Observation(
                      condition: obs.condition,
                      probability: obs.probability,
                      description: obs.description,
                    ))
                .toList()
            : null,
      );

      Logging.info('Final message prepared: ${message.message}');
      return right(message);
    } catch (error) {
      Logging.error('Error occurred: $error');
      return left(ApiErrorHandler.handle(error));
    }
  }
}
