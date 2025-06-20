import 'package:equatable/equatable.dart';

class ChatFileEntity extends Equatable {
  final String fileUrl;
  final String id;
  final String createdAt;
  final bool isDeleted;

  const ChatFileEntity({
    required this.fileUrl,
    required this.id,
    required this.createdAt,
    required this.isDeleted,
  });

  @override
  List<Object?> get props => [fileUrl, id, createdAt, isDeleted];
}
