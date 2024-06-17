// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'body_sign_in.g.dart';

@JsonSerializable()
class BodySignIn {
  const BodySignIn({
    required this.username,
    required this.password,
    this.scope = '',
    this.grantType,
    this.clientId,
    this.clientSecret,
  });
  
  factory BodySignIn.fromJson(Map<String, Object?> json) => _$BodySignInFromJson(json);
  
  @JsonKey(name: 'grant_type')
  final String? grantType;
  final String username;
  final String password;
  final String scope;
  @JsonKey(name: 'client_id')
  final String? clientId;
  @JsonKey(name: 'client_secret')
  final String? clientSecret;

  Map<String, Object?> toJson() => _$BodySignInToJson(this);
}
