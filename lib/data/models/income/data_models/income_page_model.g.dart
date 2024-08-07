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
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$IncomePageModelToJson(IncomePageModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'totalAmount': instance.totalAmount,
      'limit': instance.limit,
    };
