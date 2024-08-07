
import 'package:budget_care/data/models/common_models/base_response_model.dart';
import 'package:budget_care/data/models/income/data_models/income_page_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_incomes_res_model.g.dart';
@JsonSerializable()
class GetIncomesResModel extends BaseResponseModel{
  IncomePageModel? data;
  GetIncomesResModel({
    this.data,
    required super.status,
    super.message
});

  factory GetIncomesResModel.fromJson(Map<String,dynamic> json) => _$GetIncomesResModelFromJson(json);
  Map<String,dynamic> toJson() => _$GetIncomesResModelToJson(this);
}