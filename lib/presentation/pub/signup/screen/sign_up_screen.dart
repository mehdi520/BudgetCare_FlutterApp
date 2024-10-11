
import 'package:budget_care/data/models/auth_models/sign_up_req_model.dart';
import 'package:budget_care/domain/auth/usecases/signup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infra/common/common_export.dart';
import '../../../../infra/core/core_exports.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _passController = TextEditingController();
    TextEditingController _cnfPassController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonCubit(),
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) async {
            if(state is ButtonFailureState)
              {
                context.flushBarErrorMessage(message: state.errorMessage);
              }
            if(state is ButtonSuccessState) {
              context.flushBarSuccessMessage(message: "Signup successfully.");
             await Future.delayed(const Duration(seconds: 2));
             Navigator.pop(context);
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
                          height: MediaQuery.sizeOf(context).height * 0.08,
                        ),
                        Container(
                            width: MediaQuery.sizeOf(context).width,
                            child: Image.asset(AppImages.login_logo)),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                        ),
                        Primarytextformfield(
                          ctr: _nameController,
                          hintText: 'Name',
                          prefixIcon: AppImages.name_icon,
                          imeAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: 15),
                        Primarytextformfield(
                          ctr: _emailController,
                          hintText: 'Email',
                          prefixIcon: AppImages.email_icon,
                          imeAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 15),
                        Primarytextformfield(
                          ctr: _phoneController,
                          hintText: 'Phone',
                          prefixIcon: AppImages.phone_icon,
                          imeAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
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
                          height: 15,
                        ),
                        Primarytextformfield(
                          ctr: _cnfPassController,
                          hintText: 'Confirm Password',
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
                            text: "Sign Up",
                            onTap: () {
                              String message = "";
                              if (_nameController.text.isEmpty) {
                                message = "Name is required";
                              } else if (_emailController.text.isEmpty) {
                                message = "Email is required";
                              } else if (!emailValidator(
                                  _emailController.text)) {
                                message = "Invalid email";
                              } else if (_passController.text.isEmpty) {
                                message = "Password is required";
                              } else if (_cnfPassController.text.isEmpty) {
                                message = "Confirm Password is required";
                              } else if (_cnfPassController.text !=
                                  _passController.text) {
                                message = "Password does not match";
                              }
                              if (message.isEmpty) {
                                context.read<ButtonCubit>().execute(
                                    usecase: SignupUsecase(),
                                    params: SignUpReqModel(
                                        name: _nameController.text,
                                        email: _emailController.text,
                                        phone: _phoneController.text,
                                        password: _cnfPassController.text));
                              } else {
                                context.flushBarErrorMessage(message: message);
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
          child: Text('Already have an Account?',
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
