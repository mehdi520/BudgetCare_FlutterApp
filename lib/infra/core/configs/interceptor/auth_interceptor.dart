import 'package:dio/dio.dart';
class AuthInterceptor extends Interceptor{
  final Future<String?> Function() getToken;

  AuthInterceptor(this.getToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Add the JWT token to the request headers
    // options.headers["Authorization"] = "Bearer $token";

    try {
      final token = await getToken(); // Await the token retrieval
      if (token != null) {
        options.headers["Authorization"] = "Bearer $token";
      }
    } catch (e) {
      // Handle error, e.g., log it or take appropriate action
      print("Failed to retrieve token: $e");
    }
    print(options);
    super.onRequest(options, handler);
  }
}
