
import 'package:budget_care/data/models/income/req_models/get_income_req_model.dart';
import 'package:budget_care/domain/expense/contract/expense_repository.dart';
import 'package:budget_care/infra/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../service_locator.dart';

class GetExpenseUsecase extends Usecase<Either,GetIncomeReqModel>{
  @override
  Future<Either> call({GetIncomeReqModel? params}) async {
    return await sl<ExpenseRepository>().getExpense(params!);

  }
}