import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:budget_care/infra/core/blocs/get_login_user/get_logged_in_cubit.dart';
import 'package:budget_care/presentation/home/landing/bloc/graph_data_cubit.dart';
import 'package:budget_care/presentation/home/landing/bloc/user_total_cubit.dart';

class IncomeRouteArgModel {
  final UserTotalCubit? userTotalCubit;
  final GraphDataCubit? graphDataCubit;
  final SecureStorage? secureStorage;
  final GetLoggedInCubit? getLoggedInCubit;

  IncomeRouteArgModel({
     this.userTotalCubit,
     this.graphDataCubit,
     this.secureStorage,
    this.getLoggedInCubit
  });
}