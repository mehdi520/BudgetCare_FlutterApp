// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomeModel _$IncomeModelFromJson(Map<String, dynamic> json) => IncomeModel(
      id: (json['id'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      desciption: json['desciption'] as String?,
      date: json['date'] as String,
      catId: (json['catId'] as num).toInt(),
    );

Map<String, dynamic> _$IncomeModelToJson(IncomeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'desciption': instance.desciption,
      'date': instance.date,
      'catId': instance.catId,
    };
