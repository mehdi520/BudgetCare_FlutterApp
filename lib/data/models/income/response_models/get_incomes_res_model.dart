
import 'package:budget_care/data/models/common_models/base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../data_models/income_model.dart';
part 'get_incomes_res_model.g.dart';
@JsonSerializable()
class GetIncomesResModel extends BaseResponseModel{
  int totalPage;
  double totalAmount;
  List<IncomeModel> data;

  GetIncomesResModel({
    required this.data,
    required this.totalPage,
    required this.totalAmount,
    required super.status,
    super.message
});

  factory GetIncomesResModel.fromJson(Map<String,dynamic> json) => _$GetIncomesResModelFromJson(json);
  Map<String,dynamic> toJson() => _$GetIncomesResModelToJson(this);
}