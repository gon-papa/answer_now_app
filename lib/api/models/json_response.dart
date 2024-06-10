// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'json_response.g.dart';

@JsonSerializable()
class JsonResponse {
  const JsonResponse({
    required this.data,
    this.status = 200,
    this.message = 'ok',
  });
  
  factory JsonResponse.fromJson(Map<String, Object?> json) => _$JsonResponseFromJson(json);
  
  /// ステータスコード
  final int status;

  /// データ
  final dynamic data;

  /// メッセージ
  final String message;

  Map<String, Object?> toJson() => _$JsonResponseToJson(this);
}
