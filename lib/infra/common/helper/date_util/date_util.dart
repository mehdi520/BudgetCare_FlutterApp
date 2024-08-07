import 'package:budget_care/data/models/income/req_models/get_income_req_model.dart';
import 'package:intl/intl.dart';

 class DateUtil {
  // Gets the start and end date of today
  static Map<String, DateTime> getToday() {
    final today = DateTime.now();
    return {
      'start': DateTime(today.year, today.month, today.day),
      'end': DateTime(today.year, today.month, today.day, 23, 59, 59),
    };
  }

  // Gets the start and end date of the current week
  static Map<String, DateTime> getWeek() {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final endOfWeek = startOfWeek.add(Duration(days: 6, hours: 23, minutes: 59, seconds: 59));

    return {
      'start': DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day),
      'end': DateTime(endOfWeek.year, endOfWeek.month, endOfWeek.day, 23, 59, 59),
    };
  }

  // Gets the start and end date of the current month
  static Map<String, DateTime> getMonth() {
    final today = DateTime.now();
    final startOfMonth = DateTime(today.year, today.month, 1);
    final endOfMonth = DateTime(today.year, today.month + 1, 0, 23, 59, 59);

    return {
      'start': startOfMonth,
      'end': endOfMonth,
    };
  }

  // Gets the start and end date based on a custom date range
  static Map<String, DateTime> getDateRange(DateTime startDate, DateTime endDate) {
    final start = DateTime(startDate.year, startDate.month, startDate.day);
    final end = DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59);

    return {
      'start': start,
      'end': end,
    };
  }

  // Utility function to format dates
  static String formatDate(DateTime date) {
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(date);
  }

  static String formatDisplayDate(DateTime date) {
    final formatter = DateFormat("dd-MM-yyyy");
    return formatter.format(date);
  }

  static GetIncomeReqModel? getIncomeReqModel(int index, int page, int limit,String catId,String? startDate,String? endDate) {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

    switch (index) {
      case 1:
        var date = getToday();
        return GetIncomeReqModel(
          startDate: dateFormat.format(date['start']!),
          endDate: dateFormat.format(date['end']!),
          page: page,
          limit: limit,
          categoryId: catId == "0" ? null : catId
        );
      case 2:
        var date = getWeek();
        return GetIncomeReqModel(
          startDate: dateFormat.format(date['start']!),
          endDate: dateFormat.format(date['end']!),
          page: page,
          limit: limit,
            categoryId: catId == "0" ? null : catId

        );
      case 3:
        var date = getMonth();
        return GetIncomeReqModel(
          startDate: dateFormat.format(date['start']!),
          endDate: dateFormat.format(date['end']!),
          page: page,
          limit: limit,
            categoryId: catId == "0" ? null : catId

        );
      case 4:
       // var date = getToday();
        return GetIncomeReqModel(
          startDate: startDate!,
          endDate: endDate!,
          page: page,
          limit: limit,
            categoryId: catId == "0" ? null : catId

        );
      default:
        return null;
    }
  }
}
