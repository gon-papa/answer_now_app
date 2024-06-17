// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodySignIn _$BodySignInFromJson(Map<String, dynamic> json) => BodySignIn(
      username: json['username'] as String,
      password: json['password'] as String,
      scope: json['scope'] as String? ?? '',
      grantType: json['grant_type'] as String?,
      clientId: json['client_id'] as String?,
      clientSecret: json['client_secret'] as String?,
    );

Map<String, dynamic> _$BodySignInToJson(BodySignIn instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      'username': instance.username,
      'password': instance.password,
      'scope': instance.scope,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
