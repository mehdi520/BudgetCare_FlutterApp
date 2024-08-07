import 'package:json_annotation/json_annotation.dart';

part 'totals_data_model.g.dart';

@JsonSerializable()
class TotalsDataModel{

  double totalThisMonthIncome;
  double totalThisMonthExpense;
  double totalThisYearIncome;
  double totalThisYearExpense;

  TotalsDataModel({
    required this.totalThisMonthIncome,
    required this.totalThisMonthExpense,
    required this.totalThisYearIncome,
    required this.totalThisYearExpense,
});

  factory TotalsDataModel.fromJson(Map<String, dynamic> json) => _$TotalsDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$TotalsDataModelToJson(this);
}