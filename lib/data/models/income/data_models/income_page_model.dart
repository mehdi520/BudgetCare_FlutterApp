
import 'package:budget_care/data/models/income/data_models/income_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'income_page_model.g.dart';
@JsonSerializable()
class IncomePageModel extends Equatable {
  List<IncomeModel> data;
  int TotalPage;


  IncomePageModel({
    required this.data,
    required this.TotalPage,

  });

  @override
  List<Object?> get props => [data,TotalPage];

 factory IncomePageModel.fromJson(Map<String,dynamic> json) => _$IncomePageModelFromJson(json);
 Map<String,dynamic> toJson() => _$IncomePageModelToJson(this);
}
