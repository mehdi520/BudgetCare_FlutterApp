part of 'expense_cubit.dart';

@immutable
sealed class ExpenseState {}


class ExpenseLoadingState extends ExpenseState{}
class ExpenseLoadedState extends ExpenseState{
  final GetIncomesResModel response;
  ExpenseLoadedState({required this.response});
}

class ExpenseFailureState extends ExpenseState{
  final BaseErrorModel error;
  ExpenseFailureState({required this.error});
}