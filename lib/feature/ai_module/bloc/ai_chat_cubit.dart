import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import '../../../core/Services/mistral_service.dart';
import 'ai_chat_state.dart';
import 'states/ai_chat_error.dart';
import 'states/ai_chat_init.dart';
import 'states/ai_chat_loaded.dart';
import 'states/ai_chat_loading.dart';

class AiChatCubit extends Cubit<AiChatState> {
  final ChatController chatController = InMemoryChatController();
  final MistralService mistralService;

  AiChatCubit({required this.mistralService})
    : super(AiChatInitial("Ai chat is initial"));

  Future<void> sendMessage(String text) async {
    final userMessage = TextMessage(
      id: '${Random().nextInt(1000) + 1}',
      authorId: 'user1',
      createdAt: DateTime.now().toUtc(),
      text: text,
    );
    chatController.insertMessage(userMessage);

    emit(AiChatLoading("Ai chat is loading"));
    try {
      final res = await mistralService.getChatCompletion(text);
      final aiReply = TextMessage(
        id: '${Random().nextInt(10000) + 1000}',
        authorId: 'ai',
        createdAt: DateTime.now().toUtc(),
        text: res,
      );
      chatController.insertMessage(aiReply);
      emit(AiChatLoaded("Ai chat is loaded"));
    } catch (e) {
      emit(AiChatError(e.toString()));
    }
  }
}
