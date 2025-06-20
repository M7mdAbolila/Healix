import 'package:equatable/equatable.dart';

class CreateFamilyGroupRequestEntity extends Equatable {
  final String name;

  const CreateFamilyGroupRequestEntity({
    required this.name,
  });

  @override
  List<Object> get props => [name];
}
