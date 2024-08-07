import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());
}
