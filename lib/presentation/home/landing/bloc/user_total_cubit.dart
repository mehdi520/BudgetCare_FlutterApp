import 'package:bloc/bloc.dart';
import 'package:budget_care/data/models/common_models/base_error_model.dart';
import 'package:budget_care/data/models/statistics/data_models/totals_data_model.dart';
import 'package:budget_care/domain/user/usecases/get_user_totals_usecase.dart';
import 'package:budget_care/service_locator.dart';
import 'package:meta/meta.dart';

part 'user_total_state.dart';

class UserTotalCubit extends Cubit<UserTotalState> {
  UserTotalCubit() : super(UserTotalLoadingState());

  void getUserTotalData() async{
    var returneddata = await sl<GetUserTotalsUsecase>().call();
    returneddata.fold(
            (error){
          emit(UserTotalFailureState(error: error));
        },
            (data){
          emit(UserTotalLoadedState(response: data.data));
        });
  }

}
