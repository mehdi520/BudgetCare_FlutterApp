
import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:budget_care/data/models/common_models/base_error_model.dart';
import 'package:budget_care/domain/local_storage/contract/local_storage_repository.dart';
import 'package:dartz/dartz.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final SecureStorage _secureStorage;
  LocalStorageRepositoryImpl( this._secureStorage);

  @override
  Future<Either> getProfile() async {
    try {
      final httpResponse = await _secureStorage.getProfile();
      return Right(httpResponse);
    } catch (e) {
      print(e);
      return Left(
          BaseErrorModel(status: false,message: "User not found",code:  0)
      );
    }
  }
}