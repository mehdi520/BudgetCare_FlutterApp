import 'package:budget_care/domain/expense/contract/expense_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/core/usecase/usecase.dart';
import '../../../service_locator.dart';

class DelExpenseUsecase extends Usecase<Either,int>
{
  @override
  Future<Either> call({int? params}) async{
    return await sl<ExpenseRepository>().deleteExpense(params!);
  }

}