import 'package:json_annotation/json_annotation.dart';
part 'pass_change_req_model.g.dart';
@JsonSerializable()
class PassChangeReqModel{
  String ?   oldPassword;
  String ?   newPassword;

  PassChangeReqModel({this.oldPassword,this.newPassword});

  factory PassChangeReqModel.fromJson(Map<String, dynamic> json) => _$PassChangeReqModelFromJson(json);
  Map<String, dynamic> toJson() => _$PassChangeReqModelToJson(this);

}