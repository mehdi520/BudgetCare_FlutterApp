// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_graph_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGraphResModel _$GetGraphResModelFromJson(Map<String, dynamic> json) =>
    GetGraphResModel(
      status: json['status'] as bool,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GraphDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetGraphResModelToJson(GetGraphResModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
