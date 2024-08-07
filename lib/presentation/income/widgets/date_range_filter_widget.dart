import 'package:budget_care/infra/common/common_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infra/core/core_exports.dart';

class DateRangeFilterWidget extends StatelessWidget {
  final Function(String,String) onDatesSelected;

  DateRangeFilterWidget({super.key,required this.onDatesSelected});

  late TextEditingController _fromDateCtr;
  late TextEditingController _toDateCtr;

  @override
  void initState() {
    _fromDateCtr = TextEditingController();
    _toDateCtr = TextEditingController();
  }

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
    TextEditingController _fromDateCtr = TextEditingController();
    TextEditingController _toDateCtr = TextEditingController();
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
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
                    "Date range filter",
                    style: TextStyle(
                        color: AppColors.primary, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: context.mediaQueryHeight * 0.02,
                  ),
                  Text("Start Date",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.normal)),
                  DatePickerTextFormField(
                    ctrl: _fromDateCtr,
                    hintText: 'Select start date',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Start date is required.';
                      }
                    },
                    ontap: () {
                      _selectDate(context: context, controller: _fromDateCtr);
                    },
                  ),
                  SizedBox(
                    height: context.mediaQueryHeight * 0.02,
                  ),
                  Text("End Date",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.normal)),
                  DatePickerTextFormField(
                    ctrl: _toDateCtr,
                    hintText: 'Select end date',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'End date is required.';
                      }
                    },
                    ontap: () {
                      print("tapatap");
                      _selectDate(context: context, controller: _toDateCtr);
                    },
                  ),
                  SizedBox(
                    height: context.mediaQueryHeight * 0.05,
                  ),
                  Builder(builder: (context) {
                    return PrimaryButton(
                        text: "Apply Filter",
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            onDatesSelected( _fromDateCtr.text!, _toDateCtr.text!);
                            Navigator.pop(context);
                          }
                        });
                  })
                ],
              ),
            ),
          )),
    );
  }
}
