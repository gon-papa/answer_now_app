// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse {
  const TokenResponse({
    required this.accessToken,
    required this.refreshToken,
    this.tokenType = 'bearer',
  });
  
  factory TokenResponse.fromJson(Map<String, Object?> json) => _$TokenResponseFromJson(json);
  
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  Map<String, Object?> toJson() => _$TokenResponseToJson(this);
}
