
import 'package:budget_care/data/models/auth_models/sign_up_req_model.dart';
import 'package:budget_care/domain/auth/usecases/login_usecase.dart';
import 'package:budget_care/infra/core/configs/assets/app_images.dart';
import 'package:budget_care/presentation/home/landing/screen/landing_screen.dart';
import 'package:budget_care/presentation/pub/forgot_pass/forgot_pass_screen.dart';
import 'package:budget_care/presentation/pub/signup/screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infra/common/common_export.dart';
import '../../../../infra/core/core_exports.dart';
import '../../../../service_locator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passController = TextEditingController();
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
                          height: 15,
                        ),
                        Primarytextformfield(
                          ctr: _passController,
                          hintText: 'Password',
                          prefixIcon: AppImages.password_icon,
                          imeAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          isSecureTextField: true,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Builder(builder: (context) {
                          return PrimaryButton(
                            text: "Sign In",
                            onTap: () {
                              var message = "";
                              if (_emailController.text.isEmpty) {
                                message = "Email is required";
                              } else if (_passController.text.isEmpty) {
                                message = "Password is required";
                              }
                              if (message.isNotEmpty) {
                                context.flushBarErrorMessage(message: message);
                              } else {
                                context.read<ButtonCubit>().execute(
                                    usecase: LoginUsecase(),
                                    params: SignUpReqModel(
                                        name: "3r",
                                        email: _emailController.text,
                                        phone: "et",
                                        password: _passController.text));
                              }
                            },
                          );
                        }),
                        SizedBox(
                          height: 50,
                        ),
                        _forgetPassword(context),
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

  Widget _forgetPassword(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            AppNavigator.push(context, ForgotPassScreen());
          },
          child: Text('Forget Password',
              style: TextStyle(color: AppColors.primary)),
        ),
        Center(
          child: Container(
            height: 2,
            width: 150,
            color: AppColors.primary,
          ),
        )
      ],
    );
  }

  Widget _dont_have_Acc(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text('Do not have an Account?',
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
