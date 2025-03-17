import 'package:flutter_bloc/flutter_bloc.dart';



class IncomeCatFilterCubit extends Cubit<int> {

  IncomeCatFilterCubit() : super (0);

  int selectedCatId = 0;

  void selectCatFilter(int id) {
    selectedCatId = id;
    emit(selectedCatId);
  }
}