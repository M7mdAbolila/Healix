import 'package:equatable/equatable.dart';
import 'observation.dart';

class MessageEntity extends Equatable {
  final bool isUser;
  final String content;
  final DateTime date;
  final List<String>? options;
  final bool hasObservations;
  final List<Observation>? observations;
  final String? chatId;
  final String? id;
  final List<String>? files;

  const MessageEntity({
    required this.isUser,
    required this.content,
    required this.date,
    this.options,
    this.hasObservations = false,
    this.observations,
    this.chatId,
    this.id,
    this.files,
  });

  @override
  List<Object?> get props => [
        isUser,
        content,
        date,
        options,
        hasObservations,
        observations,
        chatId,
        id,
        files,
      ];
}
