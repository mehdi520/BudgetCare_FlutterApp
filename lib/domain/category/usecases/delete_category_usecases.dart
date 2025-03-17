import 'package:budget_care/domain/category/contract/category_repository.dart';
import 'package:budget_care/service_locator.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/core/core_exports.dart';

class DeleteCategoryUsecases extends Usecase<Either,int>{
  @override
  Future<Either> call({int? params}) async {
    return await sl<CategoryRepository>().deleteCat(params!);

  }
}