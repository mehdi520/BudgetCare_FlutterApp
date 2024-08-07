// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_incomes_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIncomesResModel _$GetIncomesResModelFromJson(Map<String, dynamic> json) =>
    GetIncomesResModel(
      data: json['data'] == null
          ? null
          : IncomePageModel.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetIncomesResModelToJson(GetIncomesResModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
