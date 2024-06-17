// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'auth_response_item.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  const AuthResponse({
    this.data,
    this.status = 200,
    this.message = 'ok',
  });
  
  factory AuthResponse.fromJson(Map<String, Object?> json) => _$AuthResponseFromJson(json);
  
  /// ステータスコード
  final int status;

  /// ユーザー情報
  final AuthResponseItem? data;

  /// メッセージ
  final String message;

  Map<String, Object?> toJson() => _$AuthResponseToJson(this);
}
