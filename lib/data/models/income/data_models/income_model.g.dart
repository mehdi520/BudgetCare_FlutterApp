// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomeModel _$IncomeModelFromJson(Map<String, dynamic> json) => IncomeModel(
      Id: (json['Id'] as num).toInt(),
      Amount: (json['Amount'] as num).toDouble(),
      Desciption: json['Desciption'] as String?,
      Date: json['Date'] as String,
      CatId: (json['CatId'] as num).toInt(),
    );

Map<String, dynamic> _$IncomeModelToJson(IncomeModel instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Amount': instance.Amount,
      'Desciption': instance.Desciption,
      'Date': instance.Date,
      'CatId': instance.CatId,
    };
