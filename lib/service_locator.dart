
import 'dart:io';

import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:budget_care/data/data_sources/remote/api_service.dart';
import 'package:budget_care/data/repository/auth/auth_repository_impl.dart';
import 'package:budget_care/data/repository/category/category_repository_impl.dart';
import 'package:budget_care/data/repository/expense/expense_repository_impl.dart';
import 'package:budget_care/data/repository/income/income_respository_impl.dart';
import 'package:budget_care/data/repository/local_storage/local_storage_repository_impl.dart';
import 'package:budget_care/data/repository/user/user_repository_impl.dart';
import 'package:budget_care/domain/auth/contract/auth_repository.dart';
import 'package:budget_care/domain/auth/usecases/signup_usecase.dart';
import 'package:budget_care/domain/category/contract/category_repository.dart';
import 'package:budget_care/domain/category/usecases/delete_category_usecases.dart';
import 'package:budget_care/domain/category/usecases/get_category_usecase.dart';
import 'package:budget_care/domain/expense/contract/expense_repository.dart';
import 'package:budget_care/domain/expense/usecases/get_expense_usecase.dart';
import 'package:budget_care/domain/income/contract/income_repository.dart';
import 'package:budget_care/domain/income/usecases/get_income_usecase.dart';
import 'package:budget_care/domain/local_storage/contract/local_storage_repository.dart';
import 'package:budget_care/domain/local_storage/usecase/getloggedinuserusecase.dart';
import 'package:budget_care/domain/user/contract/user_repository.dart';
import 'package:budget_care/domain/user/usecases/change_pass_usecase.dart';
import 'package:budget_care/domain/user/usecases/get_graph_data_usecase.dart';
import 'package:budget_care/domain/user/usecases/get_user_totals_usecase.dart';
import 'package:budget_care/domain/user/usecases/update_profile_usecase.dart';
import 'package:budget_care/presentation/home/landing/bloc/graph_data_cubit.dart';
import 'package:budget_care/presentation/home/landing/bloc/user_total_cubit.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'infra/core/core_exports.dart';

final sl = GetIt.instance;


Future<void> initializedDepencies() async {

  // Register Cubits or BLoCs
  sl.registerFactory(() => UserTotalCubit());
  sl.registerFactory(() => GraphDataCubit());

  // Register SecureStorage
  final secureStorage = SecureStorage();
  // Register SecureStorage instance
  sl.registerSingleton<SecureStorage>(secureStorage);

  //Dio
  Future<String?> getToken() async {
    return await secureStorage.getToken();
  }

  final dio = Dio();
  if(kIsWeb)
    {
      dio.options = BaseOptions(
        baseUrl: APIBaseURL,
        connectTimeout: Duration(minutes: 2),
        receiveTimeout: Duration(minutes: 2),
      );

    }
  else {
    final securityContext = SecurityContext(withTrustedRoots: true);
    final cert = await rootBundle.load('assets/cert/certificate.pem');
    print(cert);
    print(cert.buffer.asUint8List());

    securityContext.setTrustedCertificatesBytes(cert.buffer.asUint8List());
    final httpClient = HttpClient(context: securityContext);


    dio.httpClientAdapter = IOHttpClientAdapter()
      ..createHttpClient = () {
        return httpClient;
      };
  }


  // final httpClientAdapter = HttpClientAdapter();
  // dio.httpClientAdapter = httpClientAdapter;
  // dio.httpClientAdapter = IOHttpClientAdapter()
  //   ..onHttpClientCreate = (client) {
  //     return httpClient;
  //   };

  dio.options = BaseOptions(
    baseUrl: APIBaseURL,
    connectTimeout: Duration(minutes: 2),
    receiveTimeout: Duration(minutes: 2),
  );


  dio.interceptors.add(AuthInterceptor(getToken));
  dio.interceptors.add(LoggingInterceptor());

  sl.registerSingleton<Dio>(dio);
  // Services
  sl.registerSingleton(ApiService(sl()));
  // repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl(), sl()));
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(sl(), sl()));
  sl.registerSingleton<IncomeRepository>(IncomeRespositoryImpl(sl(), sl()));
  sl.registerSingleton<ExpenseRepository>(ExpenseRepositoryImpl(sl(), sl()));
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl(), sl()));
  sl.registerSingleton<LocalStorageRepository>(LocalStorageRepositoryImpl(sl()));

  // usecases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<GetCategoryUsecase>(GetCategoryUsecase());
  sl.registerSingleton<DeleteCategoryUsecases>(DeleteCategoryUsecases());
  sl.registerSingleton<GetIncomeUsecase>(GetIncomeUsecase());
  sl.registerSingleton<GetExpenseUsecase>(GetExpenseUsecase());
  sl.registerSingleton<UpdateProfileUsecase>(UpdateProfileUsecase());
  sl.registerSingleton<ChangePassUsecase>(ChangePassUsecase());
  sl.registerSingleton<GetUserTotalsUsecase>(GetUserTotalsUsecase());
  sl.registerSingleton<GetGraphDataUsecase>(GetGraphDataUsecase());
  sl.registerSingleton<Getloggedinuserusecase>(Getloggedinuserusecase());


}
