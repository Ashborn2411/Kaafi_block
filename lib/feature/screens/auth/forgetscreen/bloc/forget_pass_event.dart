import 'package:equatable/equatable.dart';

abstract class ForgetPassEvent extends Equatable {
  const ForgetPassEvent();
  @override
  List<Object?> get props => [];
}

class ForgetPassRequested extends ForgetPassEvent {
  final String email;
  const ForgetPassRequested({required this.email});
  @override
  List<Object?> get props => [email];
}
