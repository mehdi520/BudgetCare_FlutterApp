
import 'package:budget_care/data/models/income/req_models/get_income_req_model.dart';
import 'package:budget_care/domain/income/contract/income_repository.dart';
import 'package:budget_care/service_locator.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/core/core_exports.dart';

class GetIncomeUsecase extends Usecase<Either,GetIncomeReqModel>{
  @override
  Future<Either> call({GetIncomeReqModel? params}) async {
    return await sl<IncomeRepository>().getIncomes(params!);

  }
}