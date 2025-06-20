import 'package:equatable/equatable.dart';
import 'user_wrapper_entity.dart';

class SignUpResponseEntity extends Equatable {
  final String? token;
  final UserWrapperEntity? user;

  const SignUpResponseEntity({
    this.token,
    this.user,
  });

  @override
  List<Object?> get props => [token, user];
}
