
import 'package:budget_care/data/models/category/data_models/cat_model/cat_model.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository{
  Future<Either> getCategories();
  Future<Either> addOrUpdateCat(CatModel req);
  Future<Either> deleteCat(String id);
}