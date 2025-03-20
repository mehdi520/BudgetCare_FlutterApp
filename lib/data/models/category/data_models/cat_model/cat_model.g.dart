// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatModel _$CatModelFromJson(Map<String, dynamic> json) => CatModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CatModelToJson(CatModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
    };
