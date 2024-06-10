// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'user_response_item.g.dart';

@JsonSerializable()
class UserResponseItem {
  const UserResponseItem({
    required this.id,
    required this.uuid,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });
  
  factory UserResponseItem.fromJson(Map<String, Object?> json) => _$UserResponseItemFromJson(json);
  
  final int id;
  final String uuid;
  final String email;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  Map<String, Object?> toJson() => _$UserResponseItemToJson(this);
}
