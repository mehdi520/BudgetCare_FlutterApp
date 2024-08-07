import 'package:budget_care/data/data_sources/local/secure_storage_repo/secure_storage.dart';
import 'package:budget_care/data/models/user/data_model/user_model.dart';
import 'package:budget_care/infra/common/common_export.dart';
import 'package:budget_care/presentation/acc/screens/acc_screen.dart';
import 'package:budget_care/presentation/acc/screens/change_pass.dart';
import 'package:budget_care/presentation/category/screen/category_screen.dart';
import 'package:budget_care/presentation/expense/screens/expense_screen.dart';
import 'package:budget_care/presentation/home/landing/bloc/graph_data_cubit.dart';
import 'package:budget_care/presentation/home/landing/bloc/user_total_cubit.dart';
import 'package:budget_care/presentation/home/landing/widgets/bar_chart.dart';
import 'package:budget_care/presentation/income/screens/income_screen.dart';
import 'package:budget_care/presentation/pub/login/screens/login_screen.dart';
import 'package:budget_care/presentation/reports/screens/report_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infra/core/core_exports.dart';
import '../../../../service_locator.dart';

class LandingScreen extends StatelessWidget {
  SecureStorage secureStorage;

  LandingScreen({super.key, required this.secureStorage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _homeAppbar(),
        drawer: _navDrawer(context),
        body: Stack(
          children: [
            Container(
              child: Image.asset(AppImages.app_bg),
            ),
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                  UserTotalCubit()
                    ..getUserTotalData(),
                ),
              ],
              child: Column(
                children: [
                  SizedBox(
                    height: context.mediaQueryHeight * 0.02,
                  ),
                  _currentDateSection(),
                  SizedBox(
                    height: context.mediaQueryHeight * 0.03,
                  ),
                  BlocBuilder<UserTotalCubit, UserTotalState>(
                    builder: (context, state) {
                      if (state is UserTotalLoadedState) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _monthlyTotal('YOUR INCOME', state.response
                                .totalThisMonthIncome.toString()),
                            _monthlyTotal('YOUR EXPENSE', state.response
                                .totalThisMonthExpense.toString()),
                          ],
                        );
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _monthlyTotal('YOUR INCOME', '0'),
                          _monthlyTotal('YOUR EXPENSE', '0'),
                        ],
                      );
                    },
                  ),
                  Expanded(
                      child: Container(
                        // color: AppColors.primary,
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: IncomeExpenseChart()
                                  //end here
                                )),
                            BlocBuilder<UserTotalCubit, UserTotalState>(
                              builder: (context, state) {
                                if(state is UserTotalLoadedState)
                                  {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        _indicators(),
                                        _totalYear('Total Income', state.response.totalThisYearIncome.toString()),
                                        _totalYear('Total Expense', state.response.totalThisMonthExpense.toString()),
                                      ],
                                    );
                                  }
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    _indicators(),
                                    _totalYear('Total Income', '0'),
                                    _totalYear('Total Expense', '0'),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      )),
                  SizedBox(
                    height: context.mediaQueryHeight * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _bottomIconButton('INCOME', AppImages.income, () {
                        AppNavigator.push(
                            context, IncomeScreen(secureStorage: sl()));
                      }),
                      _bottomIconButton('EXPENSE', AppImages.expense, () {
                        AppNavigator.push(
                            context, ExpenseScreen(secureStorage: sl()));
                      }),
                    ],
                  ),
                  SizedBox(
                    height: context.mediaQueryHeight * 0.07,
                  )
                ],
              ),
            )
          ],
        ));
  }

  PreferredSizeWidget _homeAppbar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      iconTheme: IconThemeData(color: AppColors.white),
      title: Center(
        child: Image.asset(
          AppImages.splashlogo,
          height: 40,
          color: AppColors.white,
        ),
      ),
      actions: [
        Image.asset(
          AppImages.logout,
          height: 25,
          color: AppColors.white,
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  Widget _navDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          FutureBuilder<UserModel>(
            future: secureStorage.getProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                  ),
                  child: Center(
                    child:
                    CircularProgressIndicator(), // Show a loading indicator while fetching data
                  ),
                );
              } else if (snapshot.hasError) {
                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                  ),
                  child: Center(
                    child: Text(
                        'Error: ${snapshot
                            .error}'), // Show error message if there's an error
                  ),
                );
              } else if (snapshot.hasData) {
                final user = snapshot.data!;
                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: AppColors.primary),
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            AppImages.profile_icon,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        user.name ?? 'Name not found',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user.email ?? 'Email not found',
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              } else {
                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                  ),
                  child: Center(
                    child: Text(
                        'No data available'), // Handle case where no data is present
                  ),
                );
              }
            },
          ),
          ListTile(
            leading: Image.asset(
              AppImages.profile_icon,
              height: 25,
              width: 25,
            ),
            title: Text('My Account'),
            onTap: () {
              AppNavigator.push(
                  context,
                  AccScreen(
                    secureStorage: sl(),
                  ));
            },
          ),
          ListTile(
            leading: Image.asset(
              AppImages.category,
              height: 25,
              width: 25,
            ),
            title: Text('Category'),
            onTap: () {
              AppNavigator.push(context, CategoryScreen());
            },
          ),
          ListTile(
            leading: Image.asset(
              AppImages.income,
              height: 25,
              width: 25,
            ),
            title: Text('Income'),
            onTap: () {
              AppNavigator.push(context, IncomeScreen(secureStorage: sl()));
            },
          ),
          ListTile(
            leading: Image.asset(
              AppImages.expense,
              height: 25,
              width: 25,
            ),
            title: Text('Expense'),
            onTap: () {
              AppNavigator.push(
                  context,
                  ExpenseScreen(
                    secureStorage: sl(),
                  ));
            },
          ),
          ListTile(
            leading: Image.asset(
              AppImages.report,
              height: 25,
              width: 25,
            ),
            title: Text('Change Password'),
            onTap: () {
              AppNavigator.push(context, ChangePass());
            },
          ),
          ListTile(
            leading: Image.asset(
              AppImages.logout,
              height: 25,
              width: 25,
            ),
            title: Text('Logout'),
            onTap: () {
              secureStorage.storage.write(key: usertoken, value: '');
              AppNavigator.pushReplacement(context, LoginScreen());
            },
          ),
        ],
      ),
    );
  }

  Widget _currentDateSection() {
    return Container(
      child: Center(
        child: Text(
          DateUtil.formatDisplayDate(DateTime.now()),
          style:
          TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _monthlyTotal(String heading, String amount) {
    return Column(
      children: [
        Text(
          heading,
          style:
          TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
        Text(
          'This month so far',
          style: TextStyle(
              color: AppColors.lightBlue,
              fontWeight: FontWeight.normal,
              fontSize: 12),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          amount,
          style:
          TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _bottomIconButton(String title, String imageName,
      VoidCallback onTapCallback) {
    return InkWell(
      onTap: () {
        onTapCallback();
      },
      child: Column(
        children: [
          Image.asset(
            imageName,
            height: 50,
            width: 50,
            color: AppColors.primary,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
                color: AppColors.primary, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _indicators() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 10,
              width: 20,
              color: AppColors.primary,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              'Income ',
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 10,
              width: 20,
              color: AppColors.lightBlue,
            ),
            SizedBox(
              width: 3,
            ),
            Text(
              'Expense',
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }

  Widget _totalYear(String title, String amount) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '(This Year)',
              style: TextStyle(color: AppColors.lightBlue, fontSize: 8),
            )
          ],
        ),
        Text(
          amount,
          style: TextStyle(
              color: AppColors.primary,
              fontSize: 10,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
