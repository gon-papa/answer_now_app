// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'error_detail.dart';

part 'error_json_response.g.dart';

@JsonSerializable()
class ErrorJsonResponse {
  const ErrorJsonResponse({
    required this.detail,
  });
  
  factory ErrorJsonResponse.fromJson(Map<String, Object?> json) => _$ErrorJsonResponseFromJson(json);
  
  /// エラーメッセージ
  final List<ErrorDetail> detail;

  Map<String, Object?> toJson() => _$ErrorJsonResponseToJson(this);
}
