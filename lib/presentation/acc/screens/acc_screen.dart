import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:budget_care/data/models/user/data_model/user_model.dart';
import 'package:budget_care/data/models/user/req_model/update_profile_req_model.dart';
import 'package:budget_care/domain/user/usecases/update_profile_usecase.dart';
import 'package:budget_care/infra/common/common_export.dart';
import 'package:budget_care/infra/core/blocs/get_login_user/get_logged_in_cubit.dart';
import 'package:budget_care/infra/core/core_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccScreen extends StatelessWidget {
  SecureStorage secureStorage;
  UserModel? user;


  AccScreen({super.key, required this.secureStorage});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _nameCtr = TextEditingController();
    TextEditingController _emailCtl = TextEditingController();
    TextEditingController _phoneCtrl = TextEditingController();
    TextEditingController _dateCtrl = TextEditingController();
    return Scaffold(
        appBar: BasicAppBar(),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ButtonCubit(),
            ),
          ],
          child: BlocListener<ButtonCubit, ButtonState>(
            listener: (context, state) async {
              if (state is ButtonFailureState) {
                context.flushBarErrorMessage(message: state.errorMessage);
              }
              if (state is ButtonSuccessState) {
                user!.name = _nameCtr.text;
                user!.phone = _phoneCtrl.text;
                await secureStorage.saveProfile(user);
                 context.read<GetLoggedInCubit>().getLoggedInUser();
               // getLoggedInCubit.getLoggedInUser();

                context.flushBarSuccessMessage(
                    message: "Profile updated successfully.");
              }
            },
            child: Stack(children: [
              Container(
                child: Image.asset(AppImages.pagebg),
              ),
              FutureBuilder<UserModel>(
                future: secureStorage.getProfile(),
                builder: (context, data) {
                  if (data.hasData) {
                    user = data.data!;
                    _nameCtr.text = data.data!.name.toString();
                    _emailCtl.text = data.data!.email.toString();
                    _phoneCtrl.text = data.data!.phone.toString();
                    _dateCtrl.text = DateUtil.formatDisplayDate(
                        DateTime.parse(data.data!.createdAt.toString()));
                    return SingleChildScrollView(
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
                                Text("Name",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.normal)),
                                UnderlineTextFormField(
                                    keyboardType: TextInputType.name,
                                    ctrl: _nameCtr,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Name is required.';
                                      }
                                    },
                                    hintText: 'Name'),
                                SizedBox(
                                  height: context.mediaQueryHeight * 0.02,
                                ),
                                Text("Email",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.normal)),
                                DatePickerTextFormField(
                                  ctrl: _emailCtl,
                                  hintText: 'Select date',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Date is required.';
                                    }
                                  },
                                  ontap: () {
                                    // _selectDate(context: context, controller: _dateCtrl);
                                  },
                                ),

                                SizedBox(
                                  height: context.mediaQueryHeight * 0.02,
                                ),
                                Text("Phone Number",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.normal)),
                                UnderlineTextFormField(
                                    keyboardType: TextInputType.phone,
                                    ctrl: _phoneCtrl,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Phone number is required.';
                                      }
                                    },
                                    hintText: 'Phone number'),
                                SizedBox(
                                  height: context.mediaQueryHeight * 0.02,
                                ),
                                Text("Joinned Date",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.normal)),
                                DatePickerTextFormField(
                                  ctrl: _dateCtrl,
                                  hintText: 'Select date',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Date is required.';
                                    }
                                  },
                                  ontap: () {
                                    // _selectDate(context: context, controller: _dateCtrl);
                                  },
                                ),
                                SizedBox(
                                  height: context.mediaQueryHeight * 0.02,
                                ),
                                Builder(builder: (context) {
                                  return PrimaryButton(
                                      text: "Update Profile",
                                      onTap: () {
                                        if (_formKey.currentState?.validate() ??
                                            false) {
                                          context.read<ButtonCubit>().execute(
                                              usecase: UpdateProfileUsecase(),
                                              params: UpdateProfileReqModel(
                                                  name: _nameCtr.text,
                                                  phone: _phoneCtrl.text
                                              ));
                                        }
                                      });
                                })
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center();
                  }
                },
              )
            ]),
          ),
        ));
  }
}
