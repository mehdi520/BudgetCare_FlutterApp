import 'package:dio/dio.dart';
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("Request: ${options.method} ${options.uri}");
    print("Request Headers: ${options.headers}");
    print("Request Body: ${options.data}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("Response: ${response.statusCode} ${response.requestOptions.uri}");
    print("Response Headers: ${response.headers}");
    print("Response Body: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("Error: ${err.response?.statusCode} ${err.requestOptions.uri}");
    print("Error Message: ${err.message}");
    print("Error Message: ${err.error}");

    super.onError(err, handler);
  }
}