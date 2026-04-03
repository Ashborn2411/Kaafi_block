import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  final bool isObscured;
  const LoginInitial({this.isObscured = true});

  @override
  List<Object?> get props => [isObscured];
}

class LoginLoading extends LoginState {
  final bool isObscured;
  const LoginLoading({this.isObscured = true});

  @override
  List<Object?> get props => [isObscured];
}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}
