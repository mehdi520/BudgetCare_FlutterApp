import 'package:bloc/bloc.dart';
import 'package:budget_care/data/models/category/response_models/get_user_cats_res_model/get_user_cats_res_model.dart';
import 'package:budget_care/data/models/common_models/base_error_model.dart';
import 'package:budget_care/domain/category/usecases/delete_category_usecases.dart';
import 'package:budget_care/domain/category/usecases/get_category_usecase.dart';
import 'package:budget_care/service_locator.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoadingState());
  void getCategories() async{
    var returneddata = await sl<GetCategoryUsecase>().call();
    returneddata.fold(
            (error){
              emit(CategoryFailureState(error: error));
            },
            (data){
              emit(CategoryLoadedState(response: data));
            });
  }

  void deleteCategory(String id) async {
    var returneddata = await sl<DeleteCategoryUsecases>().call(params: id);
    returneddata.fold(
            (error){
          emit(CategoryFailureState(error: error));
        },
            (data){
          emit(CategoryDeletedSuccessState());
        });
  }
}
