import 'package:budget_care/data/models/income/data_models/income_model.dart';
import 'package:budget_care/data/models/income/req_models/get_income_req_model.dart';
import 'package:dartz/dartz.dart';

abstract class IncomeRepository{
  Future<Either> getIncomes(GetIncomeReqModel req);
  Future<Either> addOrUpdateIncome(IncomeModel req);
  Future<Either> deleteIncome(String id);
}