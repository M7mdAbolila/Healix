import 'observation.dart';

class Message {
  final bool isUser;
  final String message;
  final DateTime date;
  final List<String>? images;
  final List<String>? options;
  final bool hasObservations;
  final List<Observation>? observations;

  Message({
    required this.isUser,
    required this.message,
    required this.date,
    this.images,
    this.options,
    this.hasObservations = false,
    this.observations,
  });
}
