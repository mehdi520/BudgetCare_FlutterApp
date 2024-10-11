import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:budget_care/data/models/category/data_models/cat_model/cat_model.dart';
import 'package:budget_care/data/models/income/data_models/income_page_model.dart';
import 'package:budget_care/infra/common/invoicepdf/pdf_helper.dart';
import 'package:budget_care/infra/common/invoicepdf/report_generator.dart';
import 'package:budget_care/presentation/category/bloc/category_cubit.dart';
import 'package:budget_care/presentation/category/screen/category_screen.dart';
import 'package:budget_care/presentation/expense/blocs/expense_cubit.dart';
import 'package:budget_care/presentation/expense/widgets/add_expense_bts.dart';
import 'package:budget_care/presentation/home/landing/bloc/graph_data_cubit.dart';
import 'package:budget_care/presentation/home/landing/bloc/user_total_cubit.dart';
import 'package:budget_care/presentation/income/bloc/income_cat_filter_cubit.dart';
import 'package:budget_care/presentation/income/bloc/income_cubit.dart';
import 'package:budget_care/presentation/income/bloc/income_day_filter_cubit.dart';
import 'package:budget_care/presentation/income/widgets/add_income_bts.dart';
import 'package:budget_care/presentation/income/widgets/date_range_filter_widget.dart';
import 'package:budget_care/presentation/income/widgets/days_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/income/req_models/get_income_req_model.dart';
import '../../../infra/common/common_export.dart';
import '../../../infra/core/configs/routes/app_routes.dart';
import '../../../infra/core/core_exports.dart';

class ExpenseScreen extends StatelessWidget {
  SecureStorage secureStorage;

  ExpenseScreen({super.key, required this.secureStorage});

  IncomePageModel? incomePageModel = null;
  int pageSize = 10;
  int selectedDayIndex = 1;
  String selectedStartDate = "";
  String selectedEndDate = "";
  CatModel? selectedCat = null;

  List<CatModel> _categories = [];
  final CatModel allCategory =
      CatModel(id: '0', title: 'ALL'); // Create a custom "ALL" category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      // resizeToAvoidBottomInset: true,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => IncomeDayFilterCubit()),
          BlocProvider(create: (context) => IncomeCatFilterCubit()),
          BlocProvider(
              create: (context) =>
                  ExpenseCubit()..getExpense(getIncomeReq(context))),
        ],
        child: Column(
          children: [
            _daysWidget(context),
            SizedBox(
              height: context.mediaQueryHeight * 0.005,
            ),
            _categoryWidget(context),
            Expanded(child: BlocBuilder<ExpenseCubit, ExpenseState>(
              builder: (BuildContext context, ExpenseState state) {
                if (state is ExpenseLoadedState) {
                  incomePageModel = state.response.data;
                  if (state.response.data!.data.length! < 1) {
                    return Center(
                        child: Text("No expense found for selected filter."));
                  } else {
                    return ListView.builder(
                        itemCount: state.response.data!.data.length != null
                            ? state.response.data!.data.length!
                            : 0,
                        itemBuilder: (context, index) {
                          final cat = state.response!.data!.data[index];
                          return Card(
                            margin:
                                EdgeInsets.only(left: 15, top: 15, right: 15),
                            color: AppColors.white,
                            child: ListTile(
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    final confirmed =
                                        await showConfirmationDialog(
                                      context,
                                      title: 'Confirm Delete',
                                      content:
                                          'Are you sure you want to delete this category?',
                                      confirmButtonText: 'Delete',
                                      cancelButtonText: 'Cancel',
                                    );
                                    if (confirmed == true) {
                                      //  context.read<CategoryCubit>().deleteCategory(cat.id);
                                    }
                                  },
                                ),
                                title: Text(cat.description ?? ""),
                                subtitle: Text(cat.amount.toString() ?? ""),
                                onTap: () {
                                  // AppBottomsheet.display(context, CategoryUpdateFormWidget(onCategoryUpdated: () {
                                  //   context.read<CategoryCubit>().getCategories();
                                  // },cat: cat,));
                                }),
                          );
                        });
                  }
                }
                if (state is ExpenseLoadingState) {
                  incomePageModel = null;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ExpenseFailureState) {
                  incomePageModel = null;
                  return Center(child: Text(state.error.message ?? ""));
                }
                incomePageModel = null;
                return Center();
              },
            )),
            SizedBox(
              height: context.mediaQueryHeight * 0.005,
            ),
            _totalIncome(),
            SizedBox(
              height: context.mediaQueryHeight * 0.02,
            ),
            _bottomActionsWidget(context),
            SizedBox(
              height: context.mediaQueryHeight * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  Widget _daysWidget(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 1.0,
      child: Builder(builder: (context) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: DaysWidget(
              title: 'Today',
              filterIndex: 1,
              onButtonPressed: () {
                selectedDayIndex = 1;
                context
                    .read<IncomeDayFilterCubit>()
                    .selectDayFilter(selectedDayIndex);

                context.read<ExpenseCubit>().getExpense(getIncomeReq(context));
              },
            )),
            Expanded(
                child: DaysWidget(
              title: 'Week',
              filterIndex: 2,
              onButtonPressed: () {
                selectedDayIndex = 2;
                context.read<IncomeDayFilterCubit>().selectDayFilter(2);
                context.read<ExpenseCubit>().getExpense(getIncomeReq(context));
              },
            )),
            Expanded(
                child: DaysWidget(
              title: 'Month',
              filterIndex: 3,
              onButtonPressed: () {
                selectedDayIndex = 3;

                context.read<IncomeDayFilterCubit>().selectDayFilter(3);
                context.read<ExpenseCubit>().getExpense(getIncomeReq(context));
              },
            )),
            Expanded(
                child: DaysWidget(
              title: 'Interval',
              filterIndex: 4,
              onButtonPressed: () {
                selectedDayIndex = 4;
                context.read<IncomeDayFilterCubit>().selectDayFilter(4);

                AppBottomsheet.display(context, DateRangeFilterWidget(
                  onDatesSelected: (String startDate, String endDate) {
                    selectedStartDate = startDate;
                    selectedEndDate = endDate;
                    context
                        .read<ExpenseCubit>()
                        .getExpense(getIncomeReq(context));
                  },
                ));
              },
            )),
          ],
        );
      }),
    );
  }

  Widget _categoryWidget(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      color: Colors.white,
      elevation: 1.0,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadedState) {
            _categories = [allCategory] + state.response.data!;
            selectedCat = allCategory;
            return Container(
              height: 35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final cat = _categories[index];
                    return InkWell(
                      onTap: () {
                        selectedCat = cat;
                        context
                            .read<IncomeCatFilterCubit>()
                            .selectCatFilter(cat.id);
                        context.read<ExpenseCubit>().getExpense(
                            getIncomeReq(context)
                            // DateUtil.getIncomeReqModel(selectedDayIndex, 1, pageSize,context.read<IncomeCatFilterCubit>().selectedCatId,selectedStartDate,selectedEndDate)!
                            );
                      },
                      child: BlocBuilder<IncomeCatFilterCubit, String>(
                        builder: (context, state) {
                          return Container(
                            height: 50,
                            color: context
                                        .read<IncomeCatFilterCubit>()
                                        .selectedCatId ==
                                    cat.id
                                ? AppColors.lightBlue
                                : AppColors.white,
                            padding: EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                cat.title.toString(),
                                style: TextStyle(
                                    color: context
                                                .read<IncomeCatFilterCubit>()
                                                .selectedCatId ==
                                            cat.id
                                        ? AppColors.white
                                        : AppColors.primary),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
            );
          }
          return Center();
        },
      ),
    );
  }

  Widget _totalIncome() {
    return BlocBuilder<ExpenseCubit, ExpenseState>(builder: (context, state) {
      if (state is ExpenseLoadedState) {
        return Container(
          color: AppColors.primary,
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              "Total Expense: " + state.response.data!.totalAmount.toString(),
              style: TextStyle(
                  color: AppColors.white, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
      return Container(
        color: AppColors.primary,
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            "Total Expense: 0",
            style:
                TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    });
  }

  Widget _bottomActionsWidget(BuildContext mcontext) {
    return Builder(builder: (context) {
      return Container(
        color: AppColors.white,
        child: Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () async {
                if (incomePageModel != null) {
                  final userProfile = await secureStorage.getProfile();

                  final pdfFile = await ReportGenerator.generate(
                      incomePageModel!,
                      userProfile.name,
                      userProfile.email,
                      'EXPENSE DETAIL REPORT',
                      'Below are the expense details for the ' +
                          selectedCat!.title.toString() +
                          ' category from ' +
                          DateUtil.formatDisplayDate(
                              DateTime.parse(selectedStartDate)) +
                          " to " +
                          DateUtil.formatDisplayDate(
                              DateTime.parse(selectedEndDate)));
                  PdfHelper.openFile(context, pdfFile);
                }
              },
              child: Container(
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.print,
                      height: 35,
                      width: 35,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "PRINT",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () async {
                if (incomePageModel != null) {
                  final userProfile = await secureStorage.getProfile();

                  final pdfFile = await ReportGenerator.generate(
                      incomePageModel!,
                      userProfile.name,
                      userProfile.email,
                      'EXPENSE DETAIL REPORT',
                      'Below are the expense details for the ' +
                          selectedCat!.title.toString() +
                          ' category from ' +
                          DateUtil.formatDisplayDate(
                              DateTime.parse(selectedStartDate)) +
                          " to " +
                          DateUtil.formatDisplayDate(
                              DateTime.parse(selectedEndDate)));
                  PdfHelper.openFile(context, pdfFile);
                }
              },
              child: Container(
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.save,
                      height: 35,
                      width: 35,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "SAVE PDF",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                if (_categories.length > 1) {
                  AppBottomsheet.display(
                      mcontext,
                      AddExpenseBts(
                        onIncomeAdded: () {
                          context.read<UserTotalCubit>().getUserTotalData();
                          context.read<GraphDataCubit>().getGraphData();
                          context
                              .read<ExpenseCubit>()
                              .getExpense(getIncomeReq(context));
                        },
                        rootContext: mcontext,
                      ));
                } else {
                  context.flushBarErrorMessage(
                      message: 'Please add category first');
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.pushNamed(context, AppRoutes.categoryRoute,
                        arguments: context.read<CategoryCubit>());
                  });
                }
              },
              child: Container(
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.addnew,
                      height: 35,
                      width: 35,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "ADD EXPENSE",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      );
    });
  }

  GetIncomeReqModel getIncomeReq(BuildContext context) {
    var req = DateUtil.getIncomeReqModel(
        selectedDayIndex,
        1,
        pageSize,
        context.read<IncomeCatFilterCubit>().selectedCatId,
        selectedStartDate,
        selectedEndDate);
    selectedStartDate = req!.startDate;
    selectedEndDate = req.endDate;
    return req!;
  }
}
