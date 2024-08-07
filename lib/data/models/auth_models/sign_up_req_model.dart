import 'package:json_annotation/json_annotation.dart';

part 'sign_up_req_model.g.dart';

@JsonSerializable()
class SignUpReqModel {
  final String email;
  final String name;
  final String phone;
  final String password;

  SignUpReqModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  factory SignUpReqModel.fromJson(Map<String, dynamic> json) => _$SignUpReqModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpReqModelToJson(this);
}
