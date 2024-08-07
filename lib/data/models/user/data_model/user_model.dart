import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  final String? id;
  final String email;
   String name;
   String phone;
  final String createdAt;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
    this.id
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
