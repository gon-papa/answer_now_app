// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      accountName: json['account_name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'account_name': instance.accountName,
      'email': instance.email,
      'password': instance.password,
    };
