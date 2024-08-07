
import 'package:budget_care/presentation/home/landing/screen/landing_screen.dart';
import 'package:budget_care/presentation/pub/login/screens/login_screen.dart';
import 'package:budget_care/presentation/pub/signup/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infra/common/common_export.dart';
import '../../../infra/core/core_exports.dart';
import '../../../service_locator.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _emailController = TextEditingController();
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonCubit(),
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) async {
            if (state is ButtonFailureState) {
              context.flushBarErrorMessage(message: state.errorMessage);
            }
            if (state is ButtonSuccessState) {
              context.flushBarSuccessMessage(message: "Login successfully.");
              await Future.delayed(const Duration(seconds: 2));

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LandingScreen(secureStorage: sl(),)));
            }
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  child: Image.asset(AppImages.app_bg),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.15,
                        ),
                        Container(
                            width: MediaQuery.sizeOf(context).width,
                            child: Image.asset(AppImages.login_logo)),
                        SizedBox(height: 50),
                        Primarytextformfield(
                          ctr: _emailController,
                          hintText: 'Email',
                          prefixIcon: AppImages.email_icon,
                          imeAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        SizedBox(
                          height: 50,
                        ),
                        Builder(builder: (context) {
                          return PrimaryButton(
                            text: "Recover Password",
                            onTap: () {
                              var message = "";
                              if (_emailController.text.isEmpty) {
                                message = "Email is required";
                              }
                              if (message.isNotEmpty) {
                                context.flushBarErrorMessage(message: message);
                              } else {
                                context.flushBarErrorMessage(message: 'Something went wrong! Please try again later.');
                              }
                            },
                          );
                        }),
                        SizedBox(
                          height: 50,
                        ),

                        _dont_have_Acc(context)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget _dont_have_Acc(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
           AppNavigator.pop(context);
          },
          child: Text('Go back to Login?',
              style: TextStyle(color: AppColors.primary)),
        ),
        Center(
          child: Container(
            height: 2,
            width: 190,
            color: AppColors.primary,
          ),
        )
      ],
    );
  }
}
