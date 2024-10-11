import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:budget_care/infra/core/blocs/get_login_user/get_logged_in_cubit.dart';
import 'package:budget_care/infra/core/configs/routes/routes_arguments_model/income_route_arg_model.dart';
import 'package:budget_care/presentation/acc/screens/acc_screen.dart';
import 'package:budget_care/presentation/category/bloc/category_cubit.dart';
import 'package:budget_care/presentation/category/screen/category_screen.dart';
import 'package:budget_care/presentation/expense/screens/expense_screen.dart';
import 'package:budget_care/presentation/home/landing/screen/landing_screen.dart';
import 'package:budget_care/presentation/income/screens/income_screen.dart';
import 'package:budget_care/presentation/pub/forgot_pass/forgot_pass_screen.dart';
import 'package:budget_care/presentation/pub/login/screens/login_screen.dart';
import 'package:budget_care/presentation/pub/signup/screen/sign_up_screen.dart';
import 'package:budget_care/presentation/pub/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes{
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotRoute = '/forgot';
  static const String landingRoute = '/landing';
  static const String incomeRoute = '/income';
  static const String expenseRoute = '/expense';
  static const String categoryRoute = '/category';
  static const String accRoute = '/acc';


  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case registerRoute:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case forgotRoute:
        return MaterialPageRoute(builder: (context) => ForgotPassScreen());
      case landingRoute:
        final secureStorage = settings.arguments as SecureStorage;
        return MaterialPageRoute(
          builder: (context) => LandingScreen(secureStorage: secureStorage),
        );

      case incomeRoute:
        final args = settings.arguments as IncomeRouteArgModel;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: args.userTotalCubit!),
              BlocProvider.value(value: args.graphDataCubit!),
            ],
            child: IncomeScreen(secureStorage: args.secureStorage!),
          ),
        );

      case expenseRoute:
        final args = settings.arguments as IncomeRouteArgModel;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: args.userTotalCubit!),
              BlocProvider.value(value: args.graphDataCubit!),
            ],
            child: ExpenseScreen(secureStorage: args.secureStorage!),
          ),
        );
      case categoryRoute:
        final args = settings.arguments as CategoryCubit;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: args),
            ],
            child: CategoryScreen(),
          ),
        );
      case accRoute:
        final args = settings.arguments as IncomeRouteArgModel;

       // final args = settings.arguments as GetLoggedInCubit;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: args.getLoggedInCubit!),
            ],
            child: AccScreen(secureStorage: args.secureStorage!,),
          ),
        );
      default:
        return null;
    }
  }
}