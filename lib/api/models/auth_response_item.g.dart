// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseItem _$AuthResponseItemFromJson(Map<String, dynamic> json) =>
    AuthResponseItem(
      uuid: json['uuid'] as String,
      accountName: json['account_name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      refreshToken: json['refresh_token'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$AuthResponseItemToJson(AuthResponseItem instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'account_name': instance.accountName,
      'email': instance.email,
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
