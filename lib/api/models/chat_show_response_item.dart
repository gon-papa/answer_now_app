// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'user_response_item.dart';

part 'chat_show_response_item.g.dart';

@JsonSerializable()
class ChatShowResponseItem {
  const ChatShowResponseItem({
    required this.uuid,
    required this.body,
    required this.sendAt,
    required this.sender,
    required this.user,
  });
  
  factory ChatShowResponseItem.fromJson(Map<String, Object?> json) => _$ChatShowResponseItemFromJson(json);
  
  final String uuid;
  final String body;
  @JsonKey(name: 'send_at')
  final DateTime sendAt;
  final int sender;
  final UserResponseItem? user;

  Map<String, Object?> toJson() => _$ChatShowResponseItemToJson(this);
}
