import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:budget_care/infra/core/configs/routes/app_routes.dart';
import 'package:budget_care/presentation/home/landing/screen/landing_screen.dart';
import 'package:budget_care/presentation/pub/login/screens/login_screen.dart';
import 'package:budget_care/presentation/pub/splash/bloc/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infra/core/core_exports.dart';
import '../../../../service_locator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {

          Navigator.pushReplacementNamed(
              context,  AppRoutes.loginRoute
          );
        }
        else if(state is Authenticated)
          {
            Navigator.pushReplacementNamed(
                context,  AppRoutes.landingRoute,
                arguments: sl<SecureStorage>(),
            );
          }
      },
      child: Scaffold(
          body: Stack(children: [
        Container(child: Image.asset(AppImages.app_bg)),
        Center(
          child:
              Container(width: 300, child: Image.asset(AppImages.splashlogo)),
        ),
      ])),
    );
  }
}
