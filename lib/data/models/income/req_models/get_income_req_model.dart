class GetIncomeReqModel{
 String startDate;
 String endDate;
 String? categoryId;
 int page;
 int limit;

 GetIncomeReqModel({
   required this.startDate,
   required this.endDate,
   required this.page,
   required this.limit,
   this.categoryId
});

}