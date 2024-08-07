import 'package:budget_care/data/models/auth_models/sign_up_req_model.dart';
import 'package:budget_care/domain/auth/contract/auth_repository.dart';
import 'package:budget_care/service_locator.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/core/core_exports.dart';

class SignupUsecase implements Usecase<Either,SignUpReqModel>{
  @override
  Future<Either> call({SignUpReqModel? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }

}