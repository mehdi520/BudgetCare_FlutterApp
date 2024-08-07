import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:budget_care/data/models/user/data_model/user_model.dart';
import 'package:budget_care/data/models/user/req_model/pass_change_req_model.dart';
import 'package:budget_care/data/models/user/req_model/update_profile_req_model.dart';
import 'package:budget_care/domain/user/usecases/change_pass_usecase.dart';
import 'package:budget_care/domain/user/usecases/update_profile_usecase.dart';
import 'package:budget_care/infra/common/common_export.dart';
import 'package:budget_care/infra/core/core_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePass extends StatelessWidget {
  ChangePass({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _oldPassCtrl = TextEditingController();
    TextEditingController _newPassCtl = TextEditingController();
    TextEditingController _cnfNewPassCtl = TextEditingController();
    return Scaffold(
        appBar: BasicAppBar(),
        body: BlocProvider(
          create: (context) => ButtonCubit(),
          child: BlocListener<ButtonCubit, ButtonState>(
            listener: (context, state) async {
              if (state is ButtonFailureState) {
                context.flushBarErrorMessage(message: state.errorMessage);
              }
              if (state is ButtonSuccessState) {
                context.flushBarSuccessMessage(message: "Password updated successfully.");
              }
            },
            child: Stack(children: [
              Container(
                child: Image.asset(AppImages.pagebg),
              ),
              SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery
                              .sizeOf(context)
                              .height * 0.18,
                          horizontal: MediaQuery
                              .sizeOf(context)
                              .width * 0.05,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Old Password",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.normal)),
                                UnderlineTextFormField(
                                    keyboardType: TextInputType.name,
                                    ctrl: _oldPassCtrl,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Old password is required.';
                                      }
                                    },
                                    hintText: 'Old Password'),
                                SizedBox(
                                  height: context.mediaQueryHeight * 0.02,
                                ),
                                Text("New Password",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.normal)),

                                UnderlineTextFormField(
                                    keyboardType: TextInputType.text,
                                    isSecureTextField: true,
                                    ctrl: _newPassCtl,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'New password is required.';
                                      }
                                    },
                                    hintText: 'New Password'),

                                SizedBox(
                                  height: context.mediaQueryHeight * 0.02,
                                ),
                                Text("Confirm New Password",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.normal)),
                                UnderlineTextFormField(
                                    keyboardType: TextInputType.text,
                                    isSecureTextField: true,
                                    ctrl: _cnfNewPassCtl,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Confirm password is required.';
                                      }
                                      if(value != _newPassCtl.text)
                                        {
                                          return 'Confirm password do not match.';
                                        }
                                    },
                                    hintText: 'Confirm Password'),
                                SizedBox(
                                  height: context.mediaQueryHeight * 0.02,
                                ),

                                SizedBox(
                                  height: context.mediaQueryHeight * 0.02,
                                ),
                                Builder(builder: (context) {
                                  return PrimaryButton(
                                      text: "Update Password",
                                      onTap: () {
                                        if (_formKey.currentState?.validate() ??
                                            false) {

                                          context.read<ButtonCubit>().execute(
                                              usecase: ChangePassUsecase(),
                                              params: PassChangeReqModel(
                                                  oldPassword: _oldPassCtrl.text,
                                                  newPassword: _cnfNewPassCtl.text
                                              ));
                                        }
                                      });
                                })
                              ],
                            ),
                          ),
                        ),
                      )
                    )

            ]),
          ),
        ));
  }
}
