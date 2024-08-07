import 'package:budget_care/data/models/statistics/data_models/graph_data_model.dart';
import 'package:budget_care/data/models/user/data_model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:budget_care/data/models/common_models/base_response_model.dart';
part 'get_graph_res_model.g.dart';
@JsonSerializable()
class GetGraphResModel extends BaseResponseModel{
  final List<GraphDataModel>? data;
  GetGraphResModel({required super.status, super.message, this.data});

  factory GetGraphResModel.fromJson(Map<String, dynamic> json) => _$GetGraphResModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetGraphResModelToJson(this);
}