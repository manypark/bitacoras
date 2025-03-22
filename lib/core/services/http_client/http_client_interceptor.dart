import 'package:dio/dio.dart';

class HttpClientInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['apikey']         = Environments.apiKey;
    // options.headers['Authorization']  = "Bearer ${loginBloc.state.accesToken}";
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