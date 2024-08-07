// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomeModel _$IncomeModelFromJson(Map<String, dynamic> json) => IncomeModel(
      id: json['_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      description: json['description'] as String?,
      date: json['date'] as String,
      categoryId: json['categoryId'] as String,
    );

Map<String, dynamic> _$IncomeModelToJson(IncomeModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'amount': instance.amount,
      'description': instance.description,
      'date': instance.date,
      'categoryId': instance.categoryId,
    };
