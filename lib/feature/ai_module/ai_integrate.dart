
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/ai_chat_cubit.dart';
import 'bloc/ai_chat_state.dart';
import '../../core/Services/mistral_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class Ai_Chat extends StatelessWidget {
  const Ai_Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AiChatCubit(mistralService: MistralService()),
      child: BlocBuilder<AiChatCubit, AiChatState>(
        builder: (context, state) {
          final cubit = context.read<AiChatCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Kaffi Ai",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
              centerTitle: true,
            ),
            body: Chat(
              currentUserId: 'user1',
              resolveUser: (UserID id) async {
                return User(
                  id: id,
                  name: id == 'user1' ? 'You' : 'KAAF AI',
                );
              },
              chatController: cubit.chatController,
              onMessageSend: (text) => cubit.sendMessage(text),
            ),
          );
        },
      ),
    );
  }
}