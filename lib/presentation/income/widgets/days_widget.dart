import 'package:budget_care/infra/core/core_exports.dart';
import 'package:budget_care/presentation/income/bloc/income_cubit.dart';
import 'package:budget_care/presentation/income/bloc/income_day_filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaysWidget extends StatelessWidget {
  final String title;
  final int filterIndex;
  final VoidCallback onButtonPressed;

  const DaysWidget({
    super.key,
    required this.title,
    required this.filterIndex,
    required this.onButtonPressed

  });

  @override
  Widget build(BuildContext context) {
    return     BlocBuilder<IncomeDayFilterCubit,int >(
  builder: (context, state) {
    return InkWell(
      onTap: (){
      onButtonPressed();
      },
      child: Container(
        height: 40,
        color: context.read<IncomeDayFilterCubit>().selectedIndex == filterIndex ? AppColors.lightBlue : AppColors.white,
        child: Center(
          child: Text(title,style: TextStyle(color: context.read<IncomeDayFilterCubit>().selectedIndex == filterIndex ? AppColors.white : AppColors.primary),),
        ),
      ),
    );
  },
);
  }
}
