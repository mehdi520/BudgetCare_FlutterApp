
import 'package:budget_care/domain/user/contract/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/core/core_exports.dart';
import '../../../service_locator.dart';

class GetGraphDataUsecase extends Usecase<Either,String>
{
  @override
  Future<Either> call({String? params}) async{
    return await sl<UserRepository>().getGraphData();
  }

}