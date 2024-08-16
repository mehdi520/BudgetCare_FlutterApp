import 'package:bloc/bloc.dart';
import 'package:budget_care/data/models/user/data_model/user_model.dart';
import 'package:budget_care/domain/local_storage/contract/local_storage_repository.dart';
import 'package:budget_care/domain/local_storage/usecase/getloggedinuserusecase.dart';
import 'package:budget_care/service_locator.dart';
import 'package:meta/meta.dart';

part 'get_logged_in_state.dart';

class GetLoggedInCubit extends Cubit<GetLoggedInState> {
  GetLoggedInCubit() : super(GetLoggedInInitial());

  void getLoggedInUser() async{
    var returneddata = await sl<Getloggedinuserusecase>().call();
    returneddata.fold(
            (error){
          emit(GetLoggedFail());
        },
            (data){
          emit(GetLoggedSuccess(user: data));
        });
  }
}
