import 'package:budget_care/infra/core/blocs/get_login_user/get_logged_in_cubit.dart';
import 'package:budget_care/presentation/pub/splash/bloc/splash_cubit.dart';
import 'package:budget_care/presentation/pub/splash/screens/splash_screen.dart';
import 'package:budget_care/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'infra/core/core_exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializedDepencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          SplashCubit(sl())
            ..appStarted()
        ),
        BlocProvider(
          create: (context) => GetLoggedInCubit()..getLoggedInUser(),
        ),
      ],
      child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen()
      ),
    );
  }
}

