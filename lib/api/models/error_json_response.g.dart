// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_json_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorJsonResponse _$ErrorJsonResponseFromJson(Map<String, dynamic> json) =>
    ErrorJsonResponse(
      detail: (json['detail'] as List<dynamic>)
          .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ErrorJsonResponseToJson(ErrorJsonResponse instance) =>
    <String, dynamic>{
      'detail': instance.detail,
    };
