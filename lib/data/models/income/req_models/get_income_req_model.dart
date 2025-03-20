import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_income_req_model.g.dart';
@JsonSerializable()
class GetIncomeReqModel extends Equatable{
 String startDate;
 String endDate;
 int? categoryId;
 int pageNo;
 int pageSize;

 GetIncomeReqModel({
   required this.startDate,
   required this.endDate,
   required this.pageNo,
   required this.pageSize,
   this.categoryId
});

 factory GetIncomeReqModel.fromJson(Map<String, dynamic> json) => _$GetIncomeReqModelFromJson(json);
 Map<String, dynamic> toJson() => _$GetIncomeReqModelToJson(this);

 @override
 List<Object?> get props => [startDate,endDate,categoryId,pageNo,pageSize];

}