import '../ai_chat_state.dart';

class AiChatLoaded extends AiChatState {
  final String message;
  const AiChatLoaded(this.message);

  @override
  List<Object?> get props => [message];
}
