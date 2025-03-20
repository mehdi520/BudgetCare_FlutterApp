// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResModel _$LoginResModelFromJson(Map<String, dynamic> json) =>
    LoginResModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      access_Token: json['access_Token'] as String?,
    );

Map<String, dynamic> _$LoginResModelToJson(LoginResModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'access_Token': instance.access_Token,
    };
