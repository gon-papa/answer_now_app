// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'chat_read_request.g.dart';

@JsonSerializable()
class ChatReadRequest {
  const ChatReadRequest({
    required this.chatUuid,
  });
  
  factory ChatReadRequest.fromJson(Map<String, Object?> json) => _$ChatReadRequestFromJson(json);
  
  /// チャットUUID
  @JsonKey(name: 'chat_uuid')
  final String chatUuid;

  Map<String, Object?> toJson() => _$ChatReadRequestToJson(this);
}
