import 'package:bitacoras/core/utils/utils.dart';
import 'package:dio/dio.dart';

class HttpClientInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['apikey']         = Environments.apiKey;
    options.headers['Authorization']  = "Bearer ${Environments.apiKey}";
    options.headers["Content-Type"]   = "application/json; charset=utf-8";
    super.onRequest(options, handler);
  }
  
}