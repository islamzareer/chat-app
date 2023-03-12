part of 'chat_cubit.dart';

abstract class ChatState {
  const ChatState();
}

class ChatInitial extends ChatState {}

class ChatSuccess extends ChatState {
  List<Message> messagesList;
  ChatSuccess({required this.messagesList});
}
