// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'chat_save_message_request.g.dart';

@JsonSerializable()
class ChatSaveMessageRequest {
  const ChatSaveMessageRequest({
    required this.chatUuid,
    required this.corporationUuid,
    required this.body,
  });
  
  factory ChatSaveMessageRequest.fromJson(Map<String, Object?> json) => _$ChatSaveMessageRequestFromJson(json);
  
  /// チャットUUID
  @JsonKey(name: 'chat_uuid')
  final String chatUuid;

  /// 企業UUID
  @JsonKey(name: 'corporation_uuid')
  final String corporationUuid;

  /// メッセージ内容
  final String body;

  Map<String, Object?> toJson() => _$ChatSaveMessageRequestToJson(this);
}
