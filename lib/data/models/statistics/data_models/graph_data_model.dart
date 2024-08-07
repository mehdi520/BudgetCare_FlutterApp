import 'package:json_annotation/json_annotation.dart';

part 'graph_data_model.g.dart';

@JsonSerializable()
class GraphDataModel{

  int month;
  double totalIncome;
  double totalExpens;

  GraphDataModel(
  {
    required this.month,
    required this.totalIncome,
    required this.totalExpens,

  });

  factory GraphDataModel.fromJson(Map<String, dynamic> json) => _$GraphDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$GraphDataModelToJson(this);
}