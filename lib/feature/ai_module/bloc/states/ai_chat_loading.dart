import 'package:firstapp/feature/ai_module/bloc/ai_chat_state.dart';

class AiChatLoading extends AiChatState {
  final String message;
  const AiChatLoading(this.message);

  @override
  List<Object?> get props => [message];
}
