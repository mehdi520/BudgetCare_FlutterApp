
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeDayFilterCubit extends Cubit<int> {

  IncomeDayFilterCubit() : super (1);

  int selectedIndex = 1;

  void selectDayFilter(int index) {
    selectedIndex = index;
    emit(selectedIndex);
  }
}