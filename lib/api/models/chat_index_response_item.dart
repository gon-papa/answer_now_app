// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'chat_index_response_item.g.dart';

@JsonSerializable()
class ChatIndexResponseItem {
  const ChatIndexResponseItem({
    required this.uuid,
    required this.userId,
    required this.userName,
    required this.corporationId,
    required this.corporationName,
    required this.startedAt,
    required this.responsedAt,
    required this.closedAt,
    required this.latestMessage,
  });
  
  factory ChatIndexResponseItem.fromJson(Map<String, Object?> json) => _$ChatIndexResponseItemFromJson(json);
  
  final String uuid;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'corporation_id')
  final int corporationId;
  @JsonKey(name: 'corporation_name')
  final String corporationName;
  @JsonKey(name: 'started_at')
  final DateTime startedAt;
  @JsonKey(name: 'responsed_at')
  final DateTime? responsedAt;
  @JsonKey(name: 'closed_at')
  final DateTime? closedAt;
  @JsonKey(name: 'latest_message')
  final String? latestMessage;

  Map<String, Object?> toJson() => _$ChatIndexResponseItemToJson(this);
}
