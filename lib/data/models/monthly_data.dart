class MonthlyData{
  final String month;
  final double income;
  final double expense;

  MonthlyData(this.month, this.income, this.expense);
}

List<MonthlyData> getSampleData() {
  return [
    MonthlyData('Jan', 2000, 1500),
    MonthlyData('Feb', 2200, 1600),
    MonthlyData('Mar', 2500, 1700),
    MonthlyData('Apr', 2100, 1800),
    MonthlyData('May', 2300, 1600),
    MonthlyData('Jun', 2400, 1700),
    MonthlyData('Jul', 2600, 1500),
    MonthlyData('Aug', 2500, 1400),
    MonthlyData('Sep', 2700, 1600),
    MonthlyData('Oct', 2800, 1800),
    MonthlyData('Nov', 2900, 1700),
    MonthlyData('Dec', 3000, 2000),
  ];
}