import 'package:bloc/bloc.dart';
import 'package:budget_care/data/models/income/response_models/get_incomes_res_model.dart';
import 'package:budget_care/domain/income/usecases/get_income_usecase.dart';
import 'package:budget_care/service_locator.dart';
import 'package:meta/meta.dart';

import '../../../data/models/common_models/base_error_model.dart';
import '../../../data/models/income/req_models/get_income_req_model.dart';

part 'income_state.dart';

class IncomeCubit extends Cubit<IncomeState> {
  IncomeCubit() : super(IncomeLoadingState());

  void getIncomes(GetIncomeReqModel params) async{
    var returneddata = await sl<GetIncomeUsecase>().call(params: params);
    returneddata.fold(
            (error){
          emit(IncomeFailureState(error: error));
        },
            (data){
          emit(IncomeLoadedState(response: data));
        });
  }
}
