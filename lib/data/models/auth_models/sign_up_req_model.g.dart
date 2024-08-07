// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpReqModel _$SignUpReqModelFromJson(Map<String, dynamic> json) =>
    SignUpReqModel(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignUpReqModelToJson(SignUpReqModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
    };
