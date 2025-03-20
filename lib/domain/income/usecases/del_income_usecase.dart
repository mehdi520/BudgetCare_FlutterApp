
import 'package:budget_care/domain/income/contract/income_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/core/usecase/usecase.dart';
import '../../../service_locator.dart';

class DelIncomeUsecase extends Usecase<Either,int>
{
  @override
  Future<Either> call({int? params}) async{
    return await sl<IncomeRepository>().deleteIncome(params!);
  }

}