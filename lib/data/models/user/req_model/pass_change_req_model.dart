import 'package:json_annotation/json_annotation.dart';
part 'pass_change_req_model.g.dart';
@JsonSerializable()
class PassChangeReqModel{
  String ?   oldPass;
  String ?   newPass;

  PassChangeReqModel({this.oldPass,this.newPass});

  factory PassChangeReqModel.fromJson(Map<String, dynamic> json) => _$PassChangeReqModelFromJson(json);
  Map<String, dynamic> toJson() => _$PassChangeReqModelToJson(this);

}