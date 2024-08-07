
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core_exports.dart';
import '../../common_export.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final String? Function() onTap;

  const PrimaryButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState) {
          return _loadingButton();
        } else {
          return _initialButton();
        }
      },
    );
  }

  Widget _initialButton() {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(
              color: AppColors.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: AppColors.white),
            ),
          )),
    );
  }

  Widget _loadingButton() {
    return InkWell(
      onTap: null,
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(
              color: AppColors.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: const CircularProgressIndicator(

            ),
          )),
    );
  }
}
