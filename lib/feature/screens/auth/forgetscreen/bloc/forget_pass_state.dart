import 'package:equatable/equatable.dart';

abstract class ForgetPassState extends Equatable {
  const ForgetPassState();

  @override
  List<Object?> get props => [];
}

class ForgetPassInitial extends ForgetPassState {
  const ForgetPassInitial();
  @override
  List<Object?> get props => [];
}

class ForgetPassLoading extends ForgetPassState {
  const ForgetPassLoading();

  @override
  List<Object?> get props => [];
}

class ForgetPassSuccess extends ForgetPassState {
  const ForgetPassSuccess();

  @override
  List<Object?> get props => [];
}

class ForgetPassFailure extends ForgetPassState {
  final String error;
  const ForgetPassFailure(this.error);

  @override
  List<Object?> get props => [error];
}
