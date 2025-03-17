// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
      Id: (json['Id'] as num).toInt(),
      Title: json['Title'] as String?,
      Description: json['Description'] as String?,
    );

Map<String, dynamic> _$CatModelToJson(CatModel instance) => <String, dynamic>{
      'Id': instance.Id,
      'Title': instance.Title,
      'Description': instance.Description,
    };
