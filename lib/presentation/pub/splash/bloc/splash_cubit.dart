import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infra/core/core_exports.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final SecureStorage _secureStorage;

  SplashCubit(this._secureStorage) : super(DisplaySplash());

  void appStarted() async{
    await Future.delayed(const Duration(seconds: 2));
    String? token = await _secureStorage.readValue(usertoken);
    if(token == null || token.isEmpty) {
      emit(UnAuthenticated());
    }
    else
      {
        print("token is ) " + token);

        emit(Authenticated());
      }
  }
}
