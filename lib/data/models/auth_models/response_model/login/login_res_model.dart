import 'package:json_annotation/json_annotation.dart';

import 'package:budget_care/data/models/common_models/base_response_model.dart';

import '../../../user/data_model/user_model.dart';
part 'login_res_model.g.dart';

@JsonSerializable()
class LoginResModel extends BaseResponseModel{
  final UserModel? data;
  String? access_Token;
  LoginResModel({required super.status, super.message, this.data,this.access_Token});

  factory LoginResModel.fromJson(Map<String, dynamic> json) => _$LoginResModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResModelToJson(this);
}