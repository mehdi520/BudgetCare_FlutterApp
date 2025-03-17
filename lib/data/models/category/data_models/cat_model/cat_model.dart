import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cat_model.g.dart';
@JsonSerializable()
class CatModel extends Equatable{
  final int Id;
  final String? Title;
  final String? Description;
  // final String? CreatedAt;

  CatModel({
    required this.Id,
    this.Title,
    this.Description,
    // this.CreatedAt
  });

  factory CatModel.fromJson(Map<String, dynamic> json) => _$CatModelFromJson(json);
  Map<String, dynamic> toJson() => _$CatModelToJson(this);

  @override
  List<Object?> get props => [Id,Title,Description];
}