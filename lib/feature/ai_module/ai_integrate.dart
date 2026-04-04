import 'package:firstapp/core/Services/mistral_service.dart';
import 'package:firstapp/feature/ai_module/bloc/ai_chat_cubit.dart';
import 'package:firstapp/feature/ai_module/bloc/event/ai_chat_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'bloc/ai_chat_state.dart';

class AiChat extends StatelessWidget {
  const AiChat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AiChatBloc(mistralService: MistralService()),
      child: BlocBuilder<AiChatBloc, AiChatState>(
        builder: (context, state) {
          final bloc = context.read<AiChatBloc>();
          return Scaffold(
            appBar: AppBar(title: Text("Ai chat Bot")),
            body: Chat(
              currentUserId: "User 1",
              resolveUser: (UserID id) async =>
                  User(id: id, name: id == 'User 1' ? 'You' : 'KAAF AI'),
              chatController: bloc.chatController,
              onMessageSend: (message) {
                //passing event
                bloc.add(SendMessageEvent(message));
              },
            ),
          );
        },
      ),
    );
  }
}
