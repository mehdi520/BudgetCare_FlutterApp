
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
   int id;
   String email;
   String? name;
   String? phone;
  final String? createdAt;

  UserModel({
     this.name,
    required this.email,
     this.phone,
    required this.createdAt,
    required this.id
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
