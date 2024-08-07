import 'package:budget_care/data/models/category/data_models/cat_model/cat_model.dart';
import 'package:budget_care/domain/category/contract/category_repository.dart';
import 'package:budget_care/service_locator.dart';
import 'package:dartz/dartz.dart';

import '../../../infra/core/core_exports.dart';

class AddUpdateCategoryUsecase extends Usecase<Either,CatModel>
{
  @override
  Future<Either> call({CatModel? params}) async{
  return await sl<CategoryRepository>().addOrUpdateCat(params!);
  }

}