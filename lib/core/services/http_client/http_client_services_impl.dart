import 'package:dio/dio.dart';

import 'http_client_interceptor.dart';
import 'http_client_services.dart';
import 'package:bitacoras/core/utils/utils.dart';

class HttpClientServiceImpl extends HttpClientService {

  late final Dio _dio;

  HttpClientServiceImpl() {
    
    _dio = Dio(
      BaseOptions(
        baseUrl       : Environments.pathUrl,
        connectTimeout: const Duration( minutes: 2 ),
        receiveTimeout: const Duration( minutes: 2 ),
        responseType  : ResponseType.json
      )
    );

    _dio.interceptors.add(HttpClientInterceptor());
  }
  
  @override
  Future delete({required String path, Options? options}) async {
    final response = await _dio.get( path, options: options );
    return response.data;
  }
  
  @override
  Future get({required String path, Options? options}) async {
    final response = await _dio.get( path, options: options );
    return response.data;
  }
  
  @override
  Future post({required String path, Map<String, dynamic>? data, Options? options}) async {
    final response = await _dio.post( path, data: data, options: options );
    return response.data;
  }
  
  @override
  Future put({required String path, required Map<String, dynamic> data, Options? options}) async {
    final response = await _dio.get( path, options: options );
    return response.data;
  }
  
}
