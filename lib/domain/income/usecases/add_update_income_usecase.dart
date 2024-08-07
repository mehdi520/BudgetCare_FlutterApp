
import 'package:budget_care/data/models/income/data_models/income_model.dart';
import 'package:budget_care/domain/income/contract/income_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/core/core_exports.dart';
import '../../../service_locator.dart';

class AddUpdateIncomeUsecase extends Usecase<Either,IncomeModel>
{
  @override
  Future<Either> call({IncomeModel? params}) async{
    return await sl<IncomeRepository>().addOrUpdateIncome(params!);
  }

}