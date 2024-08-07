import 'package:bloc/bloc.dart';
import 'package:budget_care/data/models/common_models/base_error_model.dart';
import 'package:budget_care/data/models/statistics/data_models/graph_data_model.dart';
import 'package:budget_care/domain/user/usecases/get_graph_data_usecase.dart';
import 'package:budget_care/service_locator.dart';
import 'package:meta/meta.dart';

part 'graph_data_state.dart';

class GraphDataCubit extends Cubit<GraphDataState> {
  GraphDataCubit() : super(GraphDataLoadingState());

  void getGraphData() async{
    var returneddata = await sl<GetGraphDataUsecase>().call();
    returneddata.fold(
            (error){
          emit(GraphDataFailureState(error: error));
        },
            (data){
          emit(GraphDataLoadedState(response: data.data));
        });
  }
}
