import 'package:dartz/dartz.dart';

abstract class LocalStorageRepository{
  Future<Either> getProfile();
}