import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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

      /// Add the conversation history
      for (var message in conversationHistory) {
        final parts = <Part>[];
        if (message.message.isNotEmpty) {
          parts.add(Part(text: message.message));
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

      /// Add the language instruction and the current user input
      contents.add(Content(
        role: "user",
        parts: [
          Part(
              text:
                  'System: The current user message is in ${userInput.contains(RegExp(r'[a-zA-Z]')) ? 'English' : 'Arabic'}. Respond in ${userInput.contains(RegExp(r'[a-zA-Z]')) ? 'English' : 'Arabic'}.'),
          if (userInput.isNotEmpty) Part(text: userInput),
          if (images != null && images.isNotEmpty)
            ...images.map((image) => Part(
                  inlineData: InlineData(
                    mimeType: "image/jpeg",
                    data: image,
                  ),
                )),
        ],
      ));
/// prepare the request And call the API 
      final request = SendMessageRequest(
        contents: contents,
        generationConfig: GenerationConfig(
          temperature: 0.7,
          topP: 0.95,
          maxOutputTokens: 1024,
        ),
      );

      final apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
      if (apiKey.isEmpty) {
        return left(ApiErrorModel(errMessage: "API Key not found"));
      }
      final response = await _apiService.sendMessage(request, apiKey);

      /// Parse the response and decode it to
      ///  return the message
      final botReply = response.candidates[0].content.parts[0].text;
      String cleanedReply = botReply.trim();
      if (cleanedReply.startsWith('```json')) {
        cleanedReply = cleanedReply.replaceFirst('```json', '').trim();
      }
      if (cleanedReply.endsWith('```')) {
        cleanedReply =
            cleanedReply.substring(0, cleanedReply.length - 3).trim();
      }

      final jsonData = jsonDecode(cleanedReply);
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

      return right(message);
    } catch (error) {
      return left(ApiErrorHandler.handle(error));
    }
  }
}
