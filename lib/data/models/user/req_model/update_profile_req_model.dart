import 'package:json_annotation/json_annotation.dart';
part 'update_profile_req_model.g.dart';
@JsonSerializable()
class UpdateProfileReqModel{
  String ?   name;
  String ?   phone;

  UpdateProfileReqModel({this.name,this.phone});

  factory UpdateProfileReqModel.fromJson(Map<String, dynamic> json) => _$UpdateProfileReqModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateProfileReqModelToJson(this);

}