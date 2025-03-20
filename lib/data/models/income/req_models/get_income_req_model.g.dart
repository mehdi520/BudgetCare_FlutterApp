// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_income_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIncomeReqModel _$GetIncomeReqModelFromJson(Map<String, dynamic> json) =>
    GetIncomeReqModel(
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      pageNo: (json['pageNo'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GetIncomeReqModelToJson(GetIncomeReqModel instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'categoryId': instance.categoryId,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
    };
