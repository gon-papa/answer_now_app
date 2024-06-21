// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_index_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatIndexResponseItem _$ChatIndexResponseItemFromJson(
        Map<String, dynamic> json) =>
    ChatIndexResponseItem(
      uuid: json['uuid'] as String,
      userId: (json['user_id'] as num?)?.toInt(),
      userName: json['user_name'] as String?,
      corporationUuid: json['corporation_uuid'] as String,
      corporationName: json['corporation_name'] as String,
      latestMessage: json['latest_message'] as String,
      latestSendAt: DateTime.parse(json['latest_send_at'] as String),
      isRead: json['is_read'] as bool?,
    );

Map<String, dynamic> _$ChatIndexResponseItemToJson(
        ChatIndexResponseItem instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'corporation_uuid': instance.corporationUuid,
      'corporation_name': instance.corporationName,
      'latest_message': instance.latestMessage,
      'latest_send_at': instance.latestSendAt.toIso8601String(),
      'is_read': instance.isRead,
    };
