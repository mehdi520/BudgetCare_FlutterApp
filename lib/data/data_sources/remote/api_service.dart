import 'package:budget_care/data/models/auth_models/response_model/login/login_res_model.dart';
import 'package:budget_care/data/models/auth_models/sign_up_req_model.dart';
import 'package:budget_care/data/models/category/data_models/cat_model/cat_model.dart';
import 'package:budget_care/data/models/category/response_models/get_user_cats_res_model/get_user_cats_res_model.dart';
import 'package:budget_care/data/models/common_models/base_response_model.dart';
import 'package:budget_care/data/models/income/data_models/income_model.dart';
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

  @POST('api/auth/signup')
  Future<HttpResponse<BaseResponseModel>> signup(
      {@Body() required SignUpReqModel req});

  @POST('api/auth/signin')
  Future<HttpResponse<LoginResModel>> signin(
      {@Body() required SignUpReqModel req});

  @GET('api/user/me')
  Future<HttpResponse<GetProfileResModel>> getProfile();

  @PUT('api/user/updateProfile')
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

  @POST('api/category/addOrUpdateCat')
  Future<HttpResponse<BaseResponseModel>> addOrUpdateCat(
      {@Body() required CatModel req});

  @DELETE('api/category/deleteCat/{id}')
  Future<HttpResponse<BaseResponseModel>> deleteCat(
      {@Path() required String id});

  @GET('api/income/getIncomes')
  Future<HttpResponse<GetIncomesResModel>> getIncomes({
    @Query('startDate') required String startDate,
    @Query('endDate') required String endDate,
    @Query('categoryId') String? categoryId,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });

  @POST('api/income/addOrUpdateIncome')
  Future<HttpResponse<BaseResponseModel>> addOrUpdateIncome(
      {@Body() required IncomeModel req});

  @DELETE('api/income/deleteIncome/{id}')
  Future<HttpResponse<BaseResponseModel>> deleteIncome(
      {@Path() required String id});

  @GET('api/expense/getExpense')
  Future<HttpResponse<GetIncomesResModel>> getExpense({
    @Query('startDate') required String startDate,
    @Query('endDate') required String endDate,
    @Query('categoryId') String? categoryId,
    @Query('page') required int page,
    @Query('limit') required int limit,
  });

  @POST('api/expense/addOrUpdateExpense')
  Future<HttpResponse<BaseResponseModel>> addOrUpdateExpense(
      {@Body() required IncomeModel req});

  @DELETE('api/income/deleteExpense/{id}')
  Future<HttpResponse<BaseResponseModel>> deleteExpense(
      {@Path() required String id});
}
