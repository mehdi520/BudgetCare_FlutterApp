part of 'category_cubit.dart';

abstract class CategoryState{}

 class CategoryLoadingState extends CategoryState{}
 class CategoryLoadedState extends CategoryState{
  final GetUserCatsResModel response;
  CategoryLoadedState({required this.response});
}

 class CategoryFailureState extends CategoryState{
  final BaseErrorModel error;
  CategoryFailureState({required this.error});

}
class CategoryDeletedSuccessState extends CategoryState{}
