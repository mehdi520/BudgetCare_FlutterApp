
import 'package:budget_care/presentation/category/bloc/category_cubit.dart';
import 'package:budget_care/presentation/category/widgets/category_form_widget.dart';
import 'package:budget_care/presentation/category/widgets/category_update_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infra/common/common_export.dart';
import '../../../infra/core/core_exports.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CategoryCubit()
        ..getCategories(),
      child: Scaffold(
        appBar: const BasicAppBar(),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if(state is CategoryLoadedState)
              {
                return ListView.builder(
                    itemCount: state.response.data?.length != null ? state.response.data!.length! : 0,
                    itemBuilder: (context, index) {

                      final cat = state.response!.data![index];
                      return Card(
                        margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                        color: AppColors.white,
                        child: ListTile(
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red,),
                              onPressed: () async {
                                final confirmed = await showConfirmationDialog(
                                  context,
                                  title: 'Confirm Delete',
                                  content: 'Are you sure you want to delete this category?',
                                  confirmButtonText: 'Delete',
                                  cancelButtonText: 'Cancel',
                                );
                                if (confirmed == true) {
                                  context.read<CategoryCubit>().deleteCategory(cat.id);
                                }
                              },
                            ),
                            title: Text(cat.title ?? ""),
                            subtitle: Text(cat.description ?? ""),
                            onTap: () {
                              AppBottomsheet.display(context, CategoryUpdateFormWidget(onCategoryUpdated: () {
                                context.read<CategoryCubit>().getCategories();
                              },cat: cat,));
                            }
                            ),
                      );
                    });

              }
            if(state is CategoryLoadingState)
              {
                return Center(child: CircularProgressIndicator(),);
              }
            if(state is CategoryFailureState)
              {
                return Center(child: Text(state.error.message ?? ""));
              }
            if(state is CategoryDeletedSuccessState)
              {
                context.read<CategoryCubit>().getCategories();
              }
            return Center();
          },
        ),
        floatingActionButton: _floatingAddCategory(context),
      ),
    );
  }

  Widget _floatingAddCategory(BuildContext scContext) {
    return Builder(
      builder: (context) {
        return FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: AppColors.primary,
          onPressed: () {
            AppBottomsheet.display(scContext, CategoryFormWidget(onCategoryAdded: () {
              context.read<CategoryCubit>().getCategories();
            },rootContext: scContext,));
          },
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        );
      }
    );
  }
}
