import 'package:firstapp/feature/ai_module/bloc/ai_chat_state.dart';

class AiChatInitial extends AiChatState {
  final String message;
  const AiChatInitial(this.message);

  @override
  List<Object?> get props => [message];
}
