
import 'package:budget_care/data/models/income/data_models/income_model.dart';
import 'package:budget_care/data/models/user/req_model/pass_change_req_model.dart';
import 'package:budget_care/domain/auth/contract/auth_repository.dart';
import 'package:budget_care/domain/income/contract/income_repository.dart';
import 'package:budget_care/domain/user/contract/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/core/core_exports.dart';
import '../../../service_locator.dart';

class ChangePassUsecase extends Usecase<Either,PassChangeReqModel>
{
  @override
  Future<Either> call({PassChangeReqModel? params}) async{
    return await sl<UserRepository>().changePass(params!);
  }

}