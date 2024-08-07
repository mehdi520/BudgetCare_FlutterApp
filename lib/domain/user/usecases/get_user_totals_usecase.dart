
import 'package:budget_care/domain/user/contract/user_repository.dart';
import 'package:budget_care/service_locator.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/core/core_exports.dart';

class GetUserTotalsUsecase extends Usecase<Either,String>
{
  @override
  Future<Either> call({String? params}) async{
    return await sl<UserRepository>().getTotals();
  }

}