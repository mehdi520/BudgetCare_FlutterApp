

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'income_model.g.dart';
@JsonSerializable()
class IncomeModel extends Equatable{

  int Id;
  double Amount;
  String? Desciption;
  String Date;
  int CatId;


  IncomeModel({
    required this.Id,
    required this.Amount,
    required this.Desciption,
    required this.Date,
    required this.CatId,
  });

  @override
  List<Object?> get props => [Id,Amount,Desciption,Date,CatId];


  factory IncomeModel.fromJson(Map<String,dynamic> json) => _$IncomeModelFromJson(json);
  Map<String,dynamic> toJson() => _$IncomeModelToJson(this);
}