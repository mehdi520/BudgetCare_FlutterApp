import 'dart:io';
import 'package:dio/dio.dart';
import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:budget_care/data/data_sources/remote/api_service.dart';
import 'package:budget_care/data/models/common_models/base_error_model.dart';
import 'package:budget_care/data/models/income/data_models/income_model.dart';
import 'package:budget_care/data/models/income/req_models/get_income_req_model.dart';
import 'package:budget_care/domain/income/contract/income_repository.dart';
import 'package:dartz/dartz.dart';

class IncomeRespositoryImpl extends IncomeRepository {
  final ApiService _apiService;
  final SecureStorage _secureStorage;

  IncomeRespositoryImpl(this._apiService, this._secureStorage);

  @override
  Future<Either> addOrUpdateIncome(IncomeModel req) async {
    try {
      final httpResponse = await _apiService.addOrUpdateIncome(req: req);

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
  Future<Either> deleteIncome(int id) async {
    try {
      final httpResponse = await _apiService.deleteIncome(incomeId: id);

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
  Future<Either> getIncomes(GetIncomeReqModel req) async {
    try {
      final httpResponse = await _apiService.getIncomes(req: req);

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
