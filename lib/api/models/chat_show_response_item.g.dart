// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_show_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatShowResponseItem _$ChatShowResponseItemFromJson(
        Map<String, dynamic> json) =>
    ChatShowResponseItem(
      uuid: json['uuid'] as String,
      body: json['body'] as String,
      sendAt: DateTime.parse(json['send_at'] as String),
      sender: (json['sender'] as num).toInt(),
      user: json['user'] == null
          ? null
          : UserResponseItem.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatShowResponseItemToJson(
        ChatShowResponseItem instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'body': instance.body,
      'send_at': instance.sendAt.toIso8601String(),
      'sender': instance.sender,
      'user': instance.user,
    };
