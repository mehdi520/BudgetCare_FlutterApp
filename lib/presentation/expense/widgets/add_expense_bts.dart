
import 'package:budget_care/data/models/category/data_models/cat_model/cat_model.dart';
import 'package:budget_care/data/models/income/data_models/income_model.dart';
import 'package:budget_care/domain/expense/usecases/add_update_expense_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/income/usecases/add_update_income_usecase.dart';
import '../../../infra/common/common_export.dart';
import '../../../infra/core/core_exports.dart';

class AddExpenseBts extends StatelessWidget {
  final VoidCallback onIncomeAdded;
  BuildContext rootContext;

  AddExpenseBts({super.key,required this.onIncomeAdded,required this.rootContext});

  CatModel? selectedCat = null;

  Future<void> _selectDate(
      {required TextEditingController controller,
        required BuildContext context}) async {
    final DateTime? pickedDate = await ReusableDatePicker.selectDate(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      // setState(() {
      controller.text = pickedDate.toLocal().toString().split(' ')[0];
      // });
    }
  }
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _catCtrl = TextEditingController();
    TextEditingController _incDescCtrl = TextEditingController();
    TextEditingController _amountCtrl = TextEditingController();
    TextEditingController _dateCtrl = TextEditingController();

    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) async {
          if (state is ButtonSuccessState) {
            context.flushBarSuccessMessage(message: 'Expense saved successfully');
            onIncomeAdded();
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pop(context);
            });
          }
          if (state is ButtonFailureState) {
            context.flushBarErrorMessage(message: state.errorMessage);

          }
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Text(
                      "New Expense",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: context.mediaQueryHeight * 0.02,
                ),
                Text("Select Category",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.normal)),
                DatePickerTextFormField(
                  ctrl: _catCtrl,
                  hintText: 'Select category',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Category is required.';
                    }
                  },
                  ontap: () {
                    AppBottomsheet.display(rootContext, SelectCatBts(onCatSelected: (cat){
                      selectedCat = cat;
                      _catCtrl.text = cat.title.toString();
                    },));
                  },
                ),
                SizedBox(
                  height: context.mediaQueryHeight * 0.02,
                ),
                Text("Expense Description",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.normal)),
                UnderlineTextFormField(
                    ctrl: _incDescCtrl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Expense description is required.';
                      }
                    },
                    hintText: 'Expense Description'),
                SizedBox(
                  height: context.mediaQueryHeight * 0.02,
                ),
                Text("Expense Amount",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.normal)),
                UnderlineTextFormField(
                    keyboardType: TextInputType.numberWithOptions(signed: false,decimal: true),
                    ctrl: _amountCtrl,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Expense amount is required.';
                      }
                    },
                    hintText: 'Expense Amount'),
                SizedBox(
                  height: context.mediaQueryHeight * 0.02,
                ),
                Text("Date",
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
                    _selectDate(context: context, controller: _dateCtrl);
                  },
                ),
                SizedBox(
                  height: context.mediaQueryHeight * 0.02,
                ),
                Builder(builder: (context) {
                  return PrimaryButton(
                      text: "Save",
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<ButtonCubit>().execute(
                              usecase: AddUpdateExpenseUsecase(),
                              params: IncomeModel(
                                  id: '',
                                  date: _dateCtrl.text,
                                  categoryId: selectedCat!.id,
                                  amount: double.parse( _amountCtrl.text),
                                  description: _incDescCtrl.text));
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
