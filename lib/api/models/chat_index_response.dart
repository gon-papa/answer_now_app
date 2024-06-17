// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'chat_index_response_item.dart';

part 'chat_index_response.g.dart';

@JsonSerializable()
class ChatIndexResponse {
  const ChatIndexResponse({
    this.data,
    this.cursor,
    this.status = 200,
    this.message = 'ok',
  });
  
  factory ChatIndexResponse.fromJson(Map<String, Object?> json) => _$ChatIndexResponseFromJson(json);
  
  /// ステータスコード
  final int status;

  /// チャット一覧情報
  final List<ChatIndexResponseItem>? data;

  /// メッセージ
  final String message;

  /// 次のページのカーソル
  final int? cursor;

  Map<String, Object?> toJson() => _$ChatIndexResponseToJson(this);
}
