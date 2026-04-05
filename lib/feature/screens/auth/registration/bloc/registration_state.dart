import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {
  final bool isObscured;
  final bool isConfirmObscured;
  const RegisterInitial({
    this.isObscured = true,
    this.isConfirmObscured = true,
  });

  @override
  List<Object?> get props => [isObscured, isConfirmObscured];
}

class RegisterLoading extends RegisterState {
  final bool isObscuredPassword;
  final bool isObscuredConfirmPassword;
  const RegisterLoading({
    this.isObscuredPassword = true,
    this.isObscuredConfirmPassword = true,
  });

  @override
  List<Object?> get props => [isObscuredPassword, isObscuredConfirmPassword];
}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;
  const RegisterFailure(this.error);

  @override
  List<Object?> get props => [error];
}
