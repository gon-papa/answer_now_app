// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonResponse _$JsonResponseFromJson(Map<String, dynamic> json) => JsonResponse(
      data: json['data'],
      status: (json['status'] as num?)?.toInt() ?? 200,
      message: json['message'] as String? ?? 'ok',
    );

Map<String, dynamic> _$JsonResponseToJson(JsonResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
