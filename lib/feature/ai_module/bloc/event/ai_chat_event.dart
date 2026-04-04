import 'package:equatable/equatable.dart';

abstract class AiChatEvent extends Equatable {
  const AiChatEvent();

  @override
  List<Object?> get props => [];
}

class SendMessageEvent extends AiChatEvent {
  final String text;
  const SendMessageEvent(this.text);

  @override
  List<Object?> get props => [text];
}
