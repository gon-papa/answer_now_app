// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_index_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatIndexResponse _$ChatIndexResponseFromJson(Map<String, dynamic> json) =>
    ChatIndexResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => ChatIndexResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      cursor: (json['cursor'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt() ?? 200,
      message: json['message'] as String? ?? 'ok',
    );

Map<String, dynamic> _$ChatIndexResponseToJson(ChatIndexResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
      'cursor': instance.cursor,
    };
