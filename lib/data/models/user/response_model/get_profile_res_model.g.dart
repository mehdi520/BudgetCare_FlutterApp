// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileResModel _$GetProfileResModelFromJson(Map<String, dynamic> json) =>
    GetProfileResModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProfileResModelToJson(GetProfileResModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
