// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
      id: json['_id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$CatModelToJson(CatModel instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
    };
