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
      corporationId: (json['corporation_id'] as num).toInt(),
      corporationName: json['corporation_name'] as String,
      startedAt: DateTime.parse(json['started_at'] as String),
      responsedAt: json['responsed_at'] == null
          ? null
          : DateTime.parse(json['responsed_at'] as String),
      closedAt: json['closed_at'] == null
          ? null
          : DateTime.parse(json['closed_at'] as String),
      latestMessage: json['latest_message'] as String?,
    );

Map<String, dynamic> _$ChatIndexResponseItemToJson(
        ChatIndexResponseItem instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'corporation_id': instance.corporationId,
      'corporation_name': instance.corporationName,
      'started_at': instance.startedAt.toIso8601String(),
      'responsed_at': instance.responsedAt?.toIso8601String(),
      'closed_at': instance.closedAt?.toIso8601String(),
      'latest_message': instance.latestMessage,
    };
