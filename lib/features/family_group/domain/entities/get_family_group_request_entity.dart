import 'package:equatable/equatable.dart';

class GetFamilyGroupRequestEntity extends Equatable {
  final String? code;

  const GetFamilyGroupRequestEntity({
    this.code,
  });

  @override
  List<Object?> get props => [code];
}
