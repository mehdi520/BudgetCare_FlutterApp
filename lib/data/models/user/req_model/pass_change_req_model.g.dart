// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pass_change_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassChangeReqModel _$PassChangeReqModelFromJson(Map<String, dynamic> json) =>
    PassChangeReqModel(
      oldPassword: json['oldPassword'] as String?,
      newPassword: json['newPassword'] as String?,
    );

Map<String, dynamic> _$PassChangeReqModelToJson(PassChangeReqModel instance) =>
    <String, dynamic>{
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
    };
