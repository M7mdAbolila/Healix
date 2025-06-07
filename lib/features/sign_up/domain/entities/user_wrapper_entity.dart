import 'package:equatable/equatable.dart';
import 'user_entity.dart';

class UserWrapperEntity extends Equatable {
  final String? userType;
  final UserEntity? user;

  const UserWrapperEntity({
    this.userType,
    this.user,
  });

  @override
  List<Object?> get props => [userType, user];
}
