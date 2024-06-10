// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorDetail _$ErrorDetailFromJson(Map<String, dynamic> json) => ErrorDetail(
      loc: (json['loc'] as List<dynamic>).map((e) => e as String).toList(),
      msg: json['msg'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$ErrorDetailToJson(ErrorDetail instance) =>
    <String, dynamic>{
      'loc': instance.loc,
      'msg': instance.msg,
      'type': instance.type,
    };
