// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      data: AuthResponseItem.fromJson(json['data'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt() ?? 200,
      message: json['message'] as String? ?? 'ok',
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
