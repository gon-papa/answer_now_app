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
    required this.corporationUuid,
    required this.corporationName,
    required this.latestMessage,
    required this.latestSendAt,
    this.isRead,
  });
  
  factory ChatIndexResponseItem.fromJson(Map<String, Object?> json) => _$ChatIndexResponseItemFromJson(json);
  
  final String uuid;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'corporation_uuid')
  final String corporationUuid;
  @JsonKey(name: 'corporation_name')
  final String corporationName;
  @JsonKey(name: 'latest_message')
  final String latestMessage;
  @JsonKey(name: 'latest_send_at')
  final DateTime latestSendAt;

  /// 既読フラグ
  @JsonKey(name: 'is_read')
  final bool? isRead;

  Map<String, Object?> toJson() => _$ChatIndexResponseItemToJson(this);
}
