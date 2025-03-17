import 'package:dio/dio.dart';

// import 'package:bitacoras/core/utils/utils.dart';

class HttpClientInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['apikey']         = Environments.apiKey;
    // options.headers['Authorization']  = "Bearer ${Environments.apiKey}";
    // options.headers["Content-Type"]   = "application/json; charset=utf-8";
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {

    if (err.response?.statusCode == 401) {
      try {
        // TODO refresh token
      } catch (e) {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }
  
}