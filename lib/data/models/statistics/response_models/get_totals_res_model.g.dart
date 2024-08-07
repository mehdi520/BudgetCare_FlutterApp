// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_totals_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTotalsResModel _$GetTotalsResModelFromJson(Map<String, dynamic> json) =>
    GetTotalsResModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : TotalsDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTotalsResModelToJson(GetTotalsResModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
