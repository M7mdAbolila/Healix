import 'observation.dart';

class Message {
  final bool isUser;
  final String message;
  final DateTime date;
  final List<String>? options;
  final bool hasObservations;
  final List<Observation>? observations;
  final String? chatId;
  final String? id;
  final List<String>? files;

  Message({
    required this.isUser,
    required this.message,
    required this.date,
    this.options,
    this.hasObservations = false,
    this.observations,
    this.chatId,
    this.id,
    this.files,
  });
}
