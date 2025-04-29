import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rental_app/core/network/supabase/database/get_stream_data_with_spcific_id.dart';
import 'package:rental_app/core/di/dependancy_injection.dart';
import 'package:rental_app/features/owner/chat/models/message_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.id}) : super(ChatLoading()) {
    _loadMessages();
  }

  final String id;
  StreamSubscription? _streamSubscription;
  final supabase = getIt<SupabaseClient>();
  final messageController = TextEditingController();

  /// ✅ تحميل الرسائل من Supabase مع التعامل مع `jsonb` بشكل صحيح
  void _loadMessages() {
    _streamSubscription = streamDataWithSpecificId(
      tableName: "chats",
      id: id,
      primaryKey: 'id',
    ).listen((data) {
      if (data.isNotEmpty) {
        final dynamic messagesData = data[0]['messages'];
        final List<dynamic> messagesJson =
            (messagesData is List) ? messagesData : [];
        final List<ChatMessage> messages =
            messagesJson.map((json) => ChatMessage.fromJson(json)).toList();
        emit(ChatLoaded(messages: messages));
      } else {
        emit(ChatLoaded(messages: []));
      }
    });
  }

  Future<void> addMessage({required String text}) async {
    if (messageController.text.isNotEmpty) {
      try {
        final chatData = await supabase
            .from("chats")
            .select("messages")
            .eq("id", id)
            .single();
        final dynamic messagesData = chatData['messages'];
        final List<dynamic> messagesJson =
            (messagesData is List) ? messagesData : [];
        final List<ChatMessage> messages =
            messagesJson.map((json) => ChatMessage.fromJson(json)).toList();
        final newMessage =
            ChatMessage(message: text, id: supabase.auth.currentUser!.id);
        messages.add(newMessage);
        await supabase.from("chats").update({
          "messages": messages.map((m) => m.toJson()).toList(),
        }).eq("id", id);
        messageController.clear();
        emit(ChatLoaded(messages: messages));
      } catch (e) {
        emit(ChatFailed(error: e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
