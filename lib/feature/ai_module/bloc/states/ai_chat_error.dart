import '../ai_chat_state.dart';

class AiChatError extends AiChatState {
  final String message;
  const AiChatError(this.message);

  @override
  List<Object?> get props => [message];
}
