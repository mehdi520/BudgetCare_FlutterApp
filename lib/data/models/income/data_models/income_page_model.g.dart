// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomePageModel _$IncomePageModelFromJson(Map<String, dynamic> json) =>
    IncomePageModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => IncomeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      TotalPage: (json['TotalPage'] as num).toInt(),
    );

Map<String, dynamic> _$IncomePageModelToJson(IncomePageModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'TotalPage': instance.TotalPage,
    };
