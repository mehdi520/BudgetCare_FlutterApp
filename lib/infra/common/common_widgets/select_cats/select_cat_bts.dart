import 'package:budget_care/data/models/category/data_models/cat_model/cat_model.dart';
import 'package:budget_care/infra/common/common_export.dart';
import 'package:budget_care/presentation/category/bloc/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core_exports.dart';

class SelectCatBts extends StatelessWidget {

  final Function(CatModel) onCatSelected;

  const SelectCatBts({super.key,required this.onCatSelected});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..getCategories(),
      child: SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height / 2.7,
          child: Column(
            children: [
              SizedBox(
                height: context.mediaQueryHeight * 0.02,
              ),
              Center(
                  child: Text(
                    "Select category",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: context.mediaQueryHeight * 0.02,
              ),
              Expanded(
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoadingState) {
                      return Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator()
                      );
                    }
                
                    if (state is CategoryLoadedState) {
                      return _categories(state.response.data!);
                    }
                
                    if (state is CategoryFailureState) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                            state.error.message.toString()
                        ),
                      );
                    }
                
                    return const SizedBox();
                  },
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget _categories(List<CatModel> ages) {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              onCatSelected(ages[index]);
              // context.read<AgeSelectionCubit>().selectAge(
              //   ages[index]
              // );
            },
            child: Text(
              ages[index].title.toString(),
              style: const TextStyle(
                  fontSize: 18
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 20,),
        itemCount: ages.length
    );
  }

}
