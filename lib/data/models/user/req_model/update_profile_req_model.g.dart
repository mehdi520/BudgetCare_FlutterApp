// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileReqModel _$UpdateProfileReqModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileReqModel(
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UpdateProfileReqModelToJson(
        UpdateProfileReqModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
    };
