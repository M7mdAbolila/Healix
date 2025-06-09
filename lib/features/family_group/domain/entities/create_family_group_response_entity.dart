import 'package:equatable/equatable.dart';

class CreateFamilyGroupResponseEntity extends Equatable {
  final String? name;
  final String? code;

  const CreateFamilyGroupResponseEntity({
    this.name,
    this.code,
  });

  @override
  List<Object?> get props => [name, code];
}
