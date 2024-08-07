import 'package:budget_care/data/models/statistics/data_models/graph_data_model.dart';
import 'package:budget_care/data/models/statistics/data_models/totals_data_model.dart';
import 'package:budget_care/data/models/user/data_model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:budget_care/data/models/common_models/base_response_model.dart';
part 'get_totals_res_model.g.dart';
@JsonSerializable()
class GetTotalsResModel extends BaseResponseModel{
  final TotalsDataModel? data;
  GetTotalsResModel({required super.status, super.message, this.data});

  factory GetTotalsResModel.fromJson(Map<String, dynamic> json) => _$GetTotalsResModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetTotalsResModelToJson(this);
}