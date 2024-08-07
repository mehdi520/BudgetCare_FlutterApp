// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_cats_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserCatsResModel _$GetUserCatsResModelFromJson(Map<String, dynamic> json) =>
    GetUserCatsResModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserCatsResModelToJson(
        GetUserCatsResModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
