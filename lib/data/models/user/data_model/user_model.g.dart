// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      createdAt: json['createdAt'] as String?,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'createdAt': instance.createdAt,
    };
