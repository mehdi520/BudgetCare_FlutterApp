import 'package:flutter_bloc/flutter_bloc.dart';



class IncomeCatFilterCubit extends Cubit<String> {

  IncomeCatFilterCubit() : super ("0");

  String selectedCatId = "0";

  void selectCatFilter(String id) {
    selectedCatId = id;
    emit(selectedCatId);
  }
}