
import 'package:budget_care/data/models/category/data_models/cat_model/cat_model.dart';
import 'package:budget_care/domain/category/usecases/add_update_category_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infra/common/common_export.dart';
import '../../../infra/core/core_exports.dart';

class CategoryFormWidget extends StatelessWidget {
  final VoidCallback onCategoryAdded;
  BuildContext rootContext;

  CategoryFormWidget({super.key,required this.onCategoryAdded,required this.rootContext});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _catTitleCtrl = TextEditingController();
    TextEditingController _catDescCtrl = TextEditingController();
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) async {
          if (state is ButtonSuccessState) {
            context.flushBarSuccessMessage(message: 'Category saved successfully');
            onCategoryAdded();
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pop(context);
            });
          }
          if (state is ButtonFailureState) {
            context.flushBarErrorMessage(message: state.errorMessage);

          }
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                  "New Category",
                  style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: context.mediaQueryHeight * 0.02,
                ),
                Text("Category Name",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.normal)),
                UnderlineTextFormField(
                  ctrl: _catTitleCtrl,
                  hintText: 'Category Title',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Category title is required.';
                    } else if (value.length < 5) {
                      return 'Category lenght should be greater then 5';
                    }
                  },
                ),
                SizedBox(
                  height: context.mediaQueryHeight * 0.02,
                ),
                Text("Category Description",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.normal)),
                UnderlineTextFormField(
                    ctrl: _catDescCtrl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Category description is required.';
                      } else if (value.length < 5) {
                        return 'Category description should be greater then 5';
                      }
                    },
                    hintText: 'Category description'),
                SizedBox(
                  height: context.mediaQueryHeight * 0.05,
                ),
                Builder(builder: (context) {
                  return PrimaryButton(
                      text: "Save",
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<ButtonCubit>().execute(
                              usecase: AddUpdateCategoryUsecase(),
                              params: CatModel(
                                  id: '',
                                  title: _catTitleCtrl.text,
                                  description: _catDescCtrl.text));
                        }
                      });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
