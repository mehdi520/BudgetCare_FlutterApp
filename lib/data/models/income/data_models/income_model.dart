

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'income_model.g.dart';
@JsonSerializable()
class IncomeModel extends Equatable{

  @JsonKey(name: "_id")
  String id;
  double amount;
  String? description;
  String date;
  String categoryId;


  IncomeModel({
    required this.id,
    required this.amount,
    required this.description,
    required this.date,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [id,amount,description,date,categoryId];


  factory IncomeModel.fromJson(Map<String,dynamic> json) => _$IncomeModelFromJson(json);
  Map<String,dynamic> toJson() => _$IncomeModelToJson(this);
}