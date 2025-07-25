import 'package:dio/dio.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';

class HttpClientInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    if( options.path != '/auth/singIn' ) {
      final loginBloc = getIt<LoginBloc>();
      loginBloc.state.accesToken;
      options.headers['Authorization']  = "Bearer ${loginBloc.state.accesToken}";
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {

    if (err.response?.statusCode == 401) {
      try {
        
        final loginBloc = getIt<LoginBloc>();
        final token = await refreshToken();
        loginBloc.updateAccesTokenRefresh(token);
        
        final retryResponse = await retryLastRequest(err.requestOptions);
        handler.resolve(retryResponse);

      } catch (e) {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  Future<dynamic> retryLastRequest( RequestOptions requestOptions ) async {

    final loginBloc = getIt<LoginBloc>();

     final dio = Dio(
      BaseOptions(
        baseUrl       : Environments.pathUrl,
        connectTimeout: const Duration( minutes: 2 ),
        receiveTimeout: const Duration( minutes: 2 ),
        responseType  : ResponseType.json,
        method        : requestOptions.method,
      )
    );

    final response = await dio.request(
      requestOptions.path,
      queryParameters: requestOptions.queryParameters,
      data    : requestOptions.data,
      options : Options(
        headers: {
          'Authorization' : "Bearer ${loginBloc.state.accesToken}",
          'Content-Type'  : "application/json; charset=utf-8"
        }
      )
    );

    return response;
  }

  Future<String> refreshToken() async {

    final loginBloc = getIt<LoginBloc>();

    final dio = Dio(
      BaseOptions(
        baseUrl       : Environments.pathUrl,
        connectTimeout: const Duration( minutes: 2 ),
        receiveTimeout: const Duration( minutes: 2 ),
        responseType  : ResponseType.json
      )
    );

    final response = await dio.post( '/auth/refreshToken',
      data: { "token": loginBloc.state.accesToken },
    );

    final accestoken = response.data['data']['token'];

    return accestoken;
  }
  
}