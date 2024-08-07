import 'package:budget_care/domain/category/contract/category_repository.dart';
import 'package:budget_care/service_locator.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/core/core_exports.dart';

class GetCategoryUsecase extends Usecase<Either,String>{
  @override
  Future<Either> call({String? params}) async {
    return await sl<CategoryRepository>().getCategories();

  }
}