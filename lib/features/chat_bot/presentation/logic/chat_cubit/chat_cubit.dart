import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../../../core/helpers/convert_to_multipart_files.dart';
import '../../../../../core/helpers/file_info_helpers.dart';
import '../../../domain/entities/message.dart';
import '../../../domain/usecases/send_message_use_case.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final SendMessageUseCase _sendMessageUseCase;

  ChatCubit(this._sendMessageUseCase) : super(ChatInitial());

  List<Message> messages = [];
  final messageController = TextEditingController();
  final String currentTime = DateFormat('HH:mm').format(DateTime.now());
  List<String> options = [];
  String? currentChatId;
  List<PlatformFile> selectedFiles = [];

  void startNewChat() {
    currentChatId = null;
    messages.clear();
    options.clear();
    selectedFiles.clear();
    emit(ChatInitial());
  }

  Future<void> sendMessage({
    List<MultipartFile>? files,
    String? option,
  }) async {
    final messageText = option ?? messageController.text.trim();
    messageController.clear();

    final filesToSend = files ??
        (selectedFiles.isNotEmpty
            ? convertToMultipartFiles(selectedFiles)
            : null);

    if (messageText.isEmpty && (filesToSend == null || filesToSend.isEmpty)) {
      return;
    }
    emit(ChatLoading());

    final userMessage = Message(
      isUser: true,
      message: messageText,
      date: DateTime.now(),
      chatId: currentChatId,
      files: filesToSend?.map((f) => f.filename ?? '').toList(),
    );

    messages.add(userMessage);

    /// Clear selected files after creating user message
    if (selectedFiles.isNotEmpty) {
      selectedFiles.clear();
    }

    final response = await _sendMessageUseCase(
      message: messageText,
      chatId: currentChatId,
      files: filesToSend,
    );

    response.fold(
      (failure) {
        messages.add(
          Message(
            isUser: false,
            message: failure.errMessage,
            date: DateTime.now(),
            hasObservations: false,
          ),
        );
        emit(ChatFailure());
      },
      (botMessage) {
        /// Update chat ID from response if this is the first message
        if (currentChatId == null && botMessage.chatId != null) {
          currentChatId = botMessage.chatId;
        }

        messages.add(botMessage);
        options = botMessage.options ?? [];
        emit(ChatSuccess());
      },
    );
  }

  /// Pick multiple files for upload
  Future<void> pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
      );

      if (result != null && result.files.isNotEmpty) {
        const maxFileSize = 25 * 1024 * 1024;
        final validFiles =
            result.files.where((file) => file.size <= maxFileSize).toList();

        final filteredCount = result.files.length - validFiles.length;
        if (filteredCount > 0) {
          emit(
            ChatMessage(
              '$filteredCount file(s) were too large (max 25MB). Only valid files were selected.',
            ),
          );
          Future.delayed(const Duration(milliseconds: 1500), () {
            if (selectedFiles.isNotEmpty) {
              emit(ChatFilesSelected(selectedFiles));
            } else {
              emit(ChatSuccess());
            }
          });
        }

        selectedFiles.clear();
        selectedFiles.addAll(validFiles);

        if (selectedFiles.isNotEmpty) {
          emit(
            ChatFilesSelected(selectedFiles),
          );
        }
      }
    } catch (e) {
      emit(ChatFailure());
    }
  }

  /// Pick additional files to add to current selection
  Future<void> pickMoreFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
      );

      if (result != null && result.files.isNotEmpty) {
        const maxFileSize = 25 * 1024 * 1024;
        final validFiles =
            result.files.where((file) => file.size <= maxFileSize).toList();

        final initialCount = selectedFiles.length;
        int duplicateCount = 0;

        for (final newFile in validFiles) {
          final alreadyExists = selectedFiles.any((existingFile) =>
              existingFile.name == newFile.name &&
              existingFile.size == newFile.size);

          if (!alreadyExists) {
            selectedFiles.add(newFile);
          } else {
            duplicateCount++;
          }
        }

        final filteredCount = result.files.length - validFiles.length;
        final addedCount = selectedFiles.length - initialCount;

        String message = '';
        if (addedCount > 0) {
          message = '$addedCount file(s) added. ';
        }
        if (filteredCount > 0) {
          message += '$filteredCount file(s) were too large (max 50MB). ';
        }
        if (duplicateCount > 0) {
          message += '$duplicateCount duplicate file(s) were skipped.';
        }

        if (message.isNotEmpty) {
          emit(ChatMessage(message.trim()));
          Future.delayed(const Duration(milliseconds: 2000), () {
            if (selectedFiles.isNotEmpty) {
              emit(ChatFilesSelected(selectedFiles));
            } else {
              emit(ChatSuccess());
            }
          });
        } else if (selectedFiles.isNotEmpty) {
          emit(
            ChatFilesSelected(selectedFiles),
          );
        }
      }
    } catch (e) {
      emit(ChatFailure());
    }
  }

  /// Get total size of selected files in a human readable format
  String get totalSelectedFilesSize {
    if (selectedFiles.isEmpty) return '0B';

    final totalBytes =
        selectedFiles.fold<int>(0, (sum, file) => sum + file.size);
    return formatFileSize(totalBytes);
  }

  /// Remove a specific file from selected files
  void removeFile(PlatformFile file) {
    selectedFiles.remove(file);
    if (selectedFiles.isEmpty) {
      emit(ChatSuccess());
    } else {
      emit(ChatFilesSelected(selectedFiles));
    }
  }

  /// Clear all selected files
  void clearSelectedFiles() {
    selectedFiles.clear();
    emit(ChatSuccess());
  }
}
