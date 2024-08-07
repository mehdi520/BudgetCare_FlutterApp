import 'package:budget_care/data/models/user/req_model/pass_change_req_model.dart';
import 'package:budget_care/data/models/user/req_model/update_profile_req_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository{
  Future<Either> getProfile();
  Future<Either> updateProfile(UpdateProfileReqModel req);
  Future<Either> changePass(PassChangeReqModel req);
  Future<Either> getTotals();
  Future<Either> getGraphData();
}