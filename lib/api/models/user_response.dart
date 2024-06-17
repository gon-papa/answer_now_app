// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'user_response_item.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  const UserResponse({
    this.data,
    this.status = 200,
    this.message = 'ok',
  });
  
  factory UserResponse.fromJson(Map<String, Object?> json) => _$UserResponseFromJson(json);
  
  /// ステータスコード
  final int status;

  /// ユーザー情報
  final UserResponseItem? data;

  /// メッセージ
  final String message;

  Map<String, Object?> toJson() => _$UserResponseToJson(this);
}
