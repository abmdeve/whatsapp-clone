import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:whatsapp/features/chat/domain/entities/chat_entity.dart';
import 'package:whatsapp/features/chat/domain/entities/message_entity.dart';
import 'package:whatsapp/features/chat/domain/entities/message_reply_entity.dart';
import 'package:whatsapp/features/chat/domain/usecases/get_messages_usecase.dart';

import '../../../domain/usecases/delete_message_usecase.dart';
import '../../../domain/usecases/send_message_usecase.dart';
import 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final DeleteMessageUseCase deleteMessageUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final GetMessagesUseCase getMessagesUseCase;

  MessageCubit({
    required this.getMessagesUseCase,
    required this.sendMessageUseCase,
    required this.deleteMessageUseCase,
  }) : super(MessageInitial());

  Future<void> getMessages({required MessageEntity message}) async {
    try {
      emit(MessageLoading());

      final streamResponse = getMessagesUseCase.call(message);

      streamResponse.listen((messages) {
        emit(MessageLoaded(messages: messages));
      });
    } on SocketException {
      emit(MessageFailure());
    } catch (_) {
      emit(MessageFailure());
    }
  }

  Future<void> deleteMessage({required MessageEntity message}) async {
    try {
      await deleteMessageUseCase.call(message);
    } on SocketException {
      emit(MessageFailure());
    } catch (_) {
      emit(MessageFailure());
    }
  }

  Future<void> sendMessage(
      {required ChatEntity chat, required MessageEntity message}) async {
    try {
      await sendMessageUseCase.call(chat, message);
    } on SocketException {
      emit(MessageFailure());
    } catch (_) {
      emit(MessageFailure());
    }
  }

  MessageReplyEntity messageReplay = MessageReplyEntity();

  MessageReplyEntity get getMessageReply => MessageReplyEntity();

  set setMessageReplay(MessageReplyEntity messageReply) {
    this.messageReplay = messageReplay;
  }

}
