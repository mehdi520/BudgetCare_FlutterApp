part of 'graph_data_cubit.dart';

@immutable
sealed class GraphDataState {}

class GraphDataLoadingState extends GraphDataState{}
class GraphDataLoadedState extends GraphDataState{
  final List<GraphDataModel> response;
  GraphDataLoadedState({required this.response});
}

class GraphDataFailureState extends GraphDataState{
  final BaseErrorModel error;
  GraphDataFailureState({required this.error});

}
