
import 'dart:io';
import 'package:budget_care/data/models/user/req_model/pass_change_req_model.dart';
import 'package:budget_care/data/models/user/req_model/update_profile_req_model.dart';
import 'package:dio/dio.dart';
import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:budget_care/data/data_sources/remote/api_service.dart';
import 'package:budget_care/data/models/common_models/base_error_model.dart';
import 'package:budget_care/domain/user/contract/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository{
  final ApiService _apiService;
  final SecureStorage _secureStorage;

  UserRepositoryImpl(this._apiService, this._secureStorage);
  @override
  Future<Either> getProfile() async {
    try {
      final httpResponse = await _apiService.getProfile();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.response);
        if (httpResponse.data.status) {
          return Right(httpResponse.data);
        } else {
          return Left(
              BaseErrorModel(status: false,message: httpResponse.data.message,code: httpResponse.response.statusCode)
          );
        }
      } else {
        print(httpResponse.response);
        return Left(
            BaseErrorModel(status: false,message: httpResponse.data.message,code: httpResponse.response.statusCode)
        );
      }
    } on DioException catch (e) {
      print(e);
      return Left(
          BaseErrorModel(status: false,message: e.message,code: e.response?.statusCode != null ? e.response?.statusCode : 0)
      );
    }
  }

  @override
  Future<Either> changePass(PassChangeReqModel req) async {
    try {
      final httpResponse = await _apiService.changePass(req: req);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.response);
        if (httpResponse.data.status) {
          return Right(httpResponse.data);
        } else {
          return Left(
              BaseErrorModel(status: false,message: httpResponse.data.message,code: httpResponse.response.statusCode)
          );
        }
      } else {
        print(httpResponse.response);
        return Left(
            BaseErrorModel(status: false,message: httpResponse.data.message,code: httpResponse.response.statusCode)
        );
      }
    } on DioException catch (e) {
      print(e);
      return Left(
          BaseErrorModel(status: false,message: e.message,code: e.response?.statusCode != null ? e.response?.statusCode : 0)
      );
    }
  }

  @override
  Future<Either> updateProfile(UpdateProfileReqModel req) async {
    try {
      final httpResponse = await _apiService.updateProfile(req: req);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.response);
        if (httpResponse.data.status) {
          return Right(httpResponse.data);
        } else {
          return Left(
              BaseErrorModel(status: false,message: httpResponse.data.message,code: httpResponse.response.statusCode)
          );
        }
      } else {
        print(httpResponse.response);
        return Left(
            BaseErrorModel(status: false,message: httpResponse.data.message,code: httpResponse.response.statusCode)
        );
      }
    } on DioException catch (e) {
      print(e);
      return Left(
          BaseErrorModel(status: false,message: e.message,code: e.response?.statusCode != null ? e.response?.statusCode : 0)
      );
    }
  }

  @override
  Future<Either> getGraphData() async {
    try {
      final httpResponse = await _apiService.getGraphData();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.response);
        if (httpResponse.data.status) {
          return Right(httpResponse.data);
        } else {
          return Left(
              BaseErrorModel(status: false,message: httpResponse.data.message,code: httpResponse.response.statusCode)
          );
        }
      } else {
        print(httpResponse.response);
        return Left(
            BaseErrorModel(status: false,message: httpResponse.data.message,code: httpResponse.response.statusCode)
        );
      }
    } on DioException catch (e) {
      print(e);
      return Left(
          BaseErrorModel(status: false,message: e.message,code: e.response?.statusCode != null ? e.response?.statusCode : 0)
      );
    }
  }

  @override
  Future<Either> getTotals() async {
    try {
      final httpResponse = await _apiService.getTotals();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(httpResponse.response);
        if (httpResponse.data.status) {
          return Right(httpResponse.data);
        } else {
          return Left(
              BaseErrorModel(status: false,message: httpResponse.data.message,code: httpResponse.response.statusCode)
          );
        }
      } else {
        print(httpResponse.response);
        return Left(
            BaseErrorModel(status: false,message: httpResponse.data.message,code: httpResponse.response.statusCode)
        );
      }
    } on DioException catch (e) {
      print(e);
      return Left(
          BaseErrorModel(status: false,message: e.message,code: e.response?.statusCode != null ? e.response?.statusCode : 0)
      );
    }
  }

}