import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cat_model.g.dart';
@JsonSerializable()
class CatModel extends Equatable{
  final int id;
  final String? title;
  final String? description;
  // final String? CreatedAt;

  CatModel({
    required this.id,
    this.title,
    this.description,
    // this.CreatedAt
  });

  factory CatModel.fromJson(Map<String, dynamic> json) => _$CatModelFromJson(json);
  Map<String, dynamic> toJson() => _$CatModelToJson(this);

  @override
  List<Object?> get props => [id,title,description];
}