// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'chat_show_response_item.dart';

part 'chat_show_response.g.dart';

@JsonSerializable()
class ChatShowResponse {
  const ChatShowResponse({
    this.data,
    this.cursor,
    this.status = 200,
    this.message = 'ok',
  });
  
  factory ChatShowResponse.fromJson(Map<String, Object?> json) => _$ChatShowResponseFromJson(json);
  
  /// ステータスコード
  final int status;

  /// チャット詳細情報
  final List<ChatShowResponseItem>? data;

  /// メッセージ
  final String message;

  /// 次のページのカーソル
  final int? cursor;

  Map<String, Object?> toJson() => _$ChatShowResponseToJson(this);
}
