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
    return BlocProvider(
      create: (context) => SplashCubit(sl())..appStarted(),
      child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen()
      ),
    );
  }
}

