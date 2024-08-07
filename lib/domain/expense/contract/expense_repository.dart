
import 'package:budget_care/data/models/income/data_models/income_model.dart';
import 'package:budget_care/data/models/income/req_models/get_income_req_model.dart';
import 'package:dartz/dartz.dart';

abstract class ExpenseRepository{
  Future<Either> getExpense(GetIncomeReqModel req);
  Future<Either> addOrUpdateExpense(IncomeModel req);
  Future<Either> deleteExpense(String id);
}