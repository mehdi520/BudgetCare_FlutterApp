import 'package:json_annotation/json_annotation.dart';

import 'package:budget_care/data/models/common_models/base_response_model.dart';
part 'login_res_model.g.dart';

@JsonSerializable()
class LoginResModel extends BaseResponseModel{
  final String? data;
  LoginResModel({required super.status, super.message, this.data});

  factory LoginResModel.fromJson(Map<String, dynamic> json) => _$LoginResModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResModelToJson(this);
}