import 'package:bloc/bloc.dart';
import 'package:budget_care/infra/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitialState());

  Future<void> execute ({dynamic params,required Usecase usecase}) async{
    emit(ButtonLoadingState());
    try{
      Either returnedData = await usecase.call(params: params);
      returnedData.fold(
              (error){
                print(error);
            emit(ButtonFailureState(
                errorMessage: error.message
            ));
          }

          , (data){
        emit(ButtonSuccessState());
      }
      );
    }
    catch (e)
    {
      emit(ButtonFailureState(
          errorMessage: e.toString()
      ));
    }
  }
}
