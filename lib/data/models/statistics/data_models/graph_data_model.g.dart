// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraphDataModel _$GraphDataModelFromJson(Map<String, dynamic> json) =>
    GraphDataModel(
      month: (json['month'] as num).toInt(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      totalExpens: (json['totalExpens'] as num).toDouble(),
    );

Map<String, dynamic> _$GraphDataModelToJson(GraphDataModel instance) =>
    <String, dynamic>{
      'month': instance.month,
      'totalIncome': instance.totalIncome,
      'totalExpens': instance.totalExpens,
    };
