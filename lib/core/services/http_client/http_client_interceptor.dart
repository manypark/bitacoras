import 'package:dio/dio.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';

class HttpClientInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    if( options.path != '/auth/v1/token?grant_type=password' ) {

      final loginBloc = getIt<LoginBloc>(); 

      options.headers['apikey']         = Environments.apiKey;
      options.headers['Authorization']  = "Bearer ${loginBloc.state.accesToken}";

    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {

    if (err.response?.statusCode == 401) {
      try {
        // TODO refresh token
        print('-.- refresh token');
      } catch (e) {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }
  
}