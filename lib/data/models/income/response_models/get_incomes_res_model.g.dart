// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_incomes_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIncomesResModel _$GetIncomesResModelFromJson(Map<String, dynamic> json) =>
    GetIncomesResModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => IncomeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPage: (json['totalPage'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: json['status'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetIncomesResModelToJson(GetIncomesResModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'totalPage': instance.totalPage,
      'totalAmount': instance.totalAmount,
      'data': instance.data,
    };
