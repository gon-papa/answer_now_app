// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_save_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatSaveMessageRequest _$ChatSaveMessageRequestFromJson(
        Map<String, dynamic> json) =>
    ChatSaveMessageRequest(
      chatUuid: json['chat_uuid'] as String,
      corporationUuid: json['corporation_uuid'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$ChatSaveMessageRequestToJson(
        ChatSaveMessageRequest instance) =>
    <String, dynamic>{
      'chat_uuid': instance.chatUuid,
      'corporation_uuid': instance.corporationUuid,
      'body': instance.body,
    };
