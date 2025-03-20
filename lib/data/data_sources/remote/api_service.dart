import 'package:budget_care/data/models/auth_models/response_model/login/login_res_model.dart';
import 'package:budget_care/data/models/auth_models/sign_up_req_model.dart';
import 'package:budget_care/data/models/category/data_models/cat_model/cat_model.dart';
import 'package:budget_care/data/models/category/response_models/get_user_cats_res_model/get_user_cats_res_model.dart';
import 'package:budget_care/data/models/common_models/base_response_model.dart';
import 'package:budget_care/data/models/income/data_models/income_model.dart';
import 'package:budget_care/data/models/income/req_models/get_income_req_model.dart';
import 'package:budget_care/data/models/income/response_models/get_incomes_res_model.dart';
import 'package:budget_care/data/models/statistics/response_models/get_graph_res_model.dart';
import 'package:budget_care/data/models/statistics/response_models/get_totals_res_model.dart';
import 'package:budget_care/data/models/user/req_model/pass_change_req_model.dart';
import 'package:budget_care/data/models/user/req_model/update_profile_req_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../infra/core/core_exports.dart';
import '../../models/user/response_model/get_profile_res_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: APIBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST('api/pub/Register')
  Future<HttpResponse<BaseResponseModel>> signup(
      {@Body() required SignUpReqModel req});

  @POST('api/pub/login')
  Future<HttpResponse<LoginResModel>> signin(
      {@Body() required SignUpReqModel req});

  @GET('api/User/GetProfile')
  Future<HttpResponse<GetProfileResModel>> getProfile();

  @POST('api/user/updateProfile')
  Future<HttpResponse<BaseResponseModel>> updateProfile(
      {@Body() required UpdateProfileReqModel req});

  @POST('api/user/changepass')
  Future<HttpResponse<BaseResponseModel>> changePass(
      {@Body() required PassChangeReqModel req});

  @GET('api/user/summary')
  Future<HttpResponse<GetTotalsResModel>> getTotals();

  @GET('api/user/graphSummary')
  Future<HttpResponse<GetGraphResModel>> getGraphData();

  @GET('api/category/getUserCats')
  Future<HttpResponse<GetUserCatsResModel>> getUserCats();

  @POST('api/Category/addOrUpdateCat')
  Future<HttpResponse<BaseResponseModel>> addOrUpdateCat(
      {@Body() required CatModel req});

  @DELETE('api/category/delCat')
  Future<HttpResponse<BaseResponseModel>> deleteCat(
      {@Query('catId') required int id});

  @POST('api/income/getUserIncome')
  Future<HttpResponse<GetIncomesResModel>> getIncomes({
  @Body() required GetIncomeReqModel req
    // @Query('startDate') required String startDate,
    // @Query('endDate') required String endDate,
    // @Query('categoryId') int? categoryId,
    // @Query('pageNo') required int page,
    // @Query('pageSize') required int limit,
  });

  @POST('api/income/addOrUpdateIncome')
  Future<HttpResponse<BaseResponseModel>> addOrUpdateIncome(
      {@Body() required IncomeModel req});

  @GET('api/income/delIncome')
  Future<HttpResponse<BaseResponseModel>> deleteIncome(
      {
        @Query('incomeId') required int incomeId

      });

  @POST('api/expense/getUserExpense')
  Future<HttpResponse<GetIncomesResModel>> getExpense({
  @Body() required GetIncomeReqModel req
  //
  // @Query('startDate') required String startDate,
  //   @Query('endDate') required String endDate,
  //   @Query('categoryId') int? categoryId,
  //   @Query('pageNo') required int page,
  //   @Query('pageSize') required int limit,
  });

  @POST('api/expense/addOrUpdateExpense')
  Future<HttpResponse<BaseResponseModel>> addOrUpdateExpense(
      {@Body() required IncomeModel req});

  @GET('api/expense/delExpense')
  Future<HttpResponse<BaseResponseModel>> deleteExpense(
      {
        @Query('expenseId') required int expenseId
      });
}
