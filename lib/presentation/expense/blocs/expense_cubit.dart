import 'package:bloc/bloc.dart';
import 'package:budget_care/data/models/common_models/base_error_model.dart';
import 'package:budget_care/data/models/income/req_models/get_income_req_model.dart';
import 'package:budget_care/data/models/income/response_models/get_incomes_res_model.dart';
import 'package:budget_care/domain/expense/usecases/get_expense_usecase.dart';
import 'package:budget_care/service_locator.dart';
import 'package:meta/meta.dart';

part 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(ExpenseLoadingState());

  void getExpense(GetIncomeReqModel params) async{
    var returneddata = await sl<GetExpenseUsecase>().call(params: params);
    returneddata.fold(
            (error){
          emit(ExpenseFailureState(error: error));
        },
            (data){
          emit(ExpenseLoadedState(response: data));
        });
  }
}
