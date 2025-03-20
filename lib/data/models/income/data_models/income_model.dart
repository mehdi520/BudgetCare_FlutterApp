

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'income_model.g.dart';
@JsonSerializable()
class IncomeModel extends Equatable{

  int id;
  double amount;
  String? desciption;
  String date;
  int catId;


  IncomeModel({
    required this.id,
    required this.amount,
    required this.desciption,
    required this.date,
    required this.catId,
  });

  @override
  List<Object?> get props => [id,amount,desciption,date,catId];


  factory IncomeModel.fromJson(Map<String,dynamic> json) => _$IncomeModelFromJson(json);
  Map<String,dynamic> toJson() => _$IncomeModelToJson(this);
}