import 'package:budget_care/data/models/user/req_model/pass_change_req_model.dart';
import 'package:budget_care/domain/local_storage/contract/local_storage_repository.dart';
import 'package:budget_care/infra/core/usecase/usecase.dart';
import 'package:budget_care/service_locator.dart';
import 'package:dartz/dartz.dart';

class Getloggedinuserusecase extends Usecase<Either,String>
{
  @override
  Future<Either> call({String? params}) async{
    return await sl<LocalStorageRepository>().getProfile();
  }
}