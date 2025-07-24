import 'package:dio/dio.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/infrastructure/dtos/dtos.dart';

class HttpClientInterceptor extends Interceptor {

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   super.onRequest(options, handler);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {

    if (err.response?.statusCode == 401) {
      try {
        
        final loginBloc = getIt<LoginBloc>();
        final token = await refreshToken();
        loginBloc.updateAccesTokenRefresh(token);
        
        final retryResponse = await retry(err.requestOptions);
        handler.resolve(retryResponse);

      } catch (e) {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  Future<dynamic> retry( RequestOptions requestOptions ) async {

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

    final response = await dio.post(
      '/auth/v1/token?grant_type=refresh_token',
      options: Options(
        headers: {
          'Authorization' : "Bearer ${loginBloc.state.accesToken}",
          'Content-Type'  : "application/json; charset=utf-8"
        }
      ),
    );

    final accestoken = LogInDto.fromMap(response.data).data?.token ?? '';

    return accestoken;
  }
  
}