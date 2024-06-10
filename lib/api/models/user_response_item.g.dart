// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseItem _$UserResponseItemFromJson(Map<String, dynamic> json) =>
    UserResponseItem(
      id: (json['id'] as num).toInt(),
      uuid: json['uuid'] as String,
      email: json['email'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserResponseItemToJson(UserResponseItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'email': instance.email,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
