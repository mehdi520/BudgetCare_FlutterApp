import 'package:budget_care/data/models/statistics/data_models/graph_data_model.dart';
import 'package:budget_care/infra/core/configs/theme/app_colors.dart';
import 'package:budget_care/presentation/home/landing/bloc/graph_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonthlyData {
  final String month;
  final double income;
  final double expense;

  MonthlyData(this.month, this.income, this.expense);
}

List<MonthlyData> getSampleData(List<GraphDataModel> response) {
  var months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  List<MonthlyData> monthlyData = [];

  for (var i = 0; i < response.length; i++)
    {
      monthlyData.add( MonthlyData(months[i], response[i].totalIncome, response[i].totalExpens));
    }

    return monthlyData;

}


class IncomeExpenseChart extends StatelessWidget {
   List<MonthlyData> data = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraphDataCubit, GraphDataState>(
      builder: (context, state) {
        if(state is GraphDataLoadedState)
          {
            data = getSampleData(state.response);
            return BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: getMaxYValue(state.response),
                barGroups: data.map((item) {
                  return BarChartGroupData(
                    x: data.indexOf(item),
                    barRods: [
                      BarChartRodData(
                        toY: item.income,
                        color: AppColors.primary,
                        width: 10,
                        borderRadius: BorderRadius.zero,
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 3500,
                          color: Colors.transparent!,
                        ),
                      ),
                      BarChartRodData(
                        toY: item.expense,
                        color: AppColors.lightBlue,
                        width: 10,
                        borderRadius: BorderRadius.zero,
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 3500,
                          color: Colors.transparent!,

                        ),
                      ),
                    ],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            data[index].month,
                            style: TextStyle(fontSize: 14),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true,  reservedSize: 30),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
              ),

            );
          }

        if(state is GraphDataLoadingState)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  getMaxYValue(List<GraphDataModel> response) {
    if (response.isEmpty) {
      return 0; // or handle the empty list case as needed
    }

    double maxIncome = response[0].totalIncome;
    double maxExpens = response[0].totalExpens;

    for (var data in response) {
      if (data.totalIncome > maxIncome) {
        maxIncome = data.totalIncome;
      }
      if (data.totalExpens > maxExpens) {
        maxExpens = data.totalExpens;
      }
    }

    return maxIncome > maxExpens ? maxIncome : maxExpens;
  }

}
