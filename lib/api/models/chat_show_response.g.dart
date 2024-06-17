// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_show_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatShowResponse _$ChatShowResponseFromJson(Map<String, dynamic> json) =>
    ChatShowResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChatShowResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      cursor: (json['cursor'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt() ?? 200,
      message: json['message'] as String? ?? 'ok',
    );

Map<String, dynamic> _$ChatShowResponseToJson(ChatShowResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
      'cursor': instance.cursor,
    };
