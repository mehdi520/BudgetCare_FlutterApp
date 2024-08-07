import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cat_model.g.dart';
@JsonSerializable()
class CatModel extends Equatable{
  @JsonKey(name: '_id')
  final String id;
  final String? title;
  final String? description;
  final String? createdAt;

  CatModel({
    required this.id,
    this.title,
    this.description,
    this.createdAt
  });

  factory CatModel.fromJson(Map<String, dynamic> json) => _$CatModelFromJson(json);
  Map<String, dynamic> toJson() => _$CatModelToJson(this);

  @override
  List<Object?> get props => [id,title,description,createdAt];
}