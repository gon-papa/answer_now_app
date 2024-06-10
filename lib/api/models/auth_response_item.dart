// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'auth_response_item.g.dart';

@JsonSerializable()
class AuthResponseItem {
  const AuthResponseItem({
    required this.uuid,
    required this.accountName,
    required this.email,
    required this.token,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
  });
  
  factory AuthResponseItem.fromJson(Map<String, Object?> json) => _$AuthResponseItemFromJson(json);
  
  final String uuid;
  @JsonKey(name: 'account_name')
  final String accountName;
  final String email;
  final String token;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Map<String, Object?> toJson() => _$AuthResponseItemToJson(this);
}
