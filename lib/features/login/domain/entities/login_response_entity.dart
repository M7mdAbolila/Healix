import 'package:equatable/equatable.dart';
import 'user_wrapper_entity.dart';

class LoginResponseEntity extends Equatable {
  final String? token;
  final UserWrapperEntity? user;

  const LoginResponseEntity({
    this.token,
    this.user,
  });

  @override
  List<Object?> get props => [token, user];
}
