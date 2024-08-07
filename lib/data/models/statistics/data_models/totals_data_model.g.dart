// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totals_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalsDataModel _$TotalsDataModelFromJson(Map<String, dynamic> json) =>
    TotalsDataModel(
      totalThisMonthIncome: (json['totalThisMonthIncome'] as num).toDouble(),
      totalThisMonthExpense: (json['totalThisMonthExpense'] as num).toDouble(),
      totalThisYearIncome: (json['totalThisYearIncome'] as num).toDouble(),
      totalThisYearExpense: (json['totalThisYearExpense'] as num).toDouble(),
    );

Map<String, dynamic> _$TotalsDataModelToJson(TotalsDataModel instance) =>
    <String, dynamic>{
      'totalThisMonthIncome': instance.totalThisMonthIncome,
      'totalThisMonthExpense': instance.totalThisMonthExpense,
      'totalThisYearIncome': instance.totalThisYearIncome,
      'totalThisYearExpense': instance.totalThisYearExpense,
    };
