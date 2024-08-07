part of 'income_cubit.dart';

@immutable
sealed class IncomeState {

}


class IncomeLoadingState extends IncomeState{}
class IncomeLoadedState extends IncomeState{
  final GetIncomesResModel response;
  IncomeLoadedState({required this.response});
}

class IncomeFailureState extends IncomeState{
  final BaseErrorModel error;
  IncomeFailureState({required this.error});

}
