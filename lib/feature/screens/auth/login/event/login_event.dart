import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class TogglePasswordVisibility extends LoginEvent {}

class SignInRequested extends LoginEvent {
  final String email;
  final String password;

  const SignInRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
