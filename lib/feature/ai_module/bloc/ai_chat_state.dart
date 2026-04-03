import 'package:equatable/equatable.dart';

abstract class AiChatState extends Equatable {
  const AiChatState();

  @override
  List<Object?> get props => [];
}

class AiChatInitial extends AiChatState {}

class AiChatLoading extends AiChatState {}

class AiChatLoaded extends AiChatState {}

class AiChatError extends AiChatState {
  final String message;
  const AiChatError(this.message);

  @override
  List<Object?> get props => [message];
}
