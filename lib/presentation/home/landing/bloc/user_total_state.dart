part of 'user_total_cubit.dart';

@immutable
sealed class UserTotalState {}

class UserTotalLoadingState extends UserTotalState{}
class UserTotalLoadedState extends UserTotalState{
  final TotalsDataModel response;
  UserTotalLoadedState({required this.response});
}

class UserTotalFailureState extends UserTotalState{
  final BaseErrorModel error;
  UserTotalFailureState({required this.error});

}
