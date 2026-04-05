import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

// Toggle password visibility during registration
class TogglePasswordVisibility extends RegisterEvent {}

class ToggleConfirmPasswordVisibility extends RegisterEvent {}

// When user submits registration form
class SignUpRequested extends RegisterEvent {
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpRequested(this.email, this.password, this.confirmPassword);

  @override
  List<Object?> get props => [email, password, confirmPassword];
}
