// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'error_detail.g.dart';

@JsonSerializable()
class ErrorDetail {
  const ErrorDetail({
    required this.loc,
    required this.msg,
    required this.type,
  });
  
  factory ErrorDetail.fromJson(Map<String, Object?> json) => _$ErrorDetailFromJson(json);
  
  /// エラー箇所
  final List<String> loc;

  /// エラーメッセージ
  final String msg;

  /// エラータイプ
  final String type;

  Map<String, Object?> toJson() => _$ErrorDetailToJson(this);
}
