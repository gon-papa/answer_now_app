// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  const SignUpRequest({
    required this.accountName,
    required this.email,
    required this.password,
  });
  
  factory SignUpRequest.fromJson(Map<String, Object?> json) => _$SignUpRequestFromJson(json);
  
  /// アカウント名
  @JsonKey(name: 'account_name')
  final String accountName;

  /// メールアドレス
  final String email;

  /// パスワード
  final String password;

  Map<String, Object?> toJson() => _$SignUpRequestToJson(this);
}
