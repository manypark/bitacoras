import 'package:dio/dio.dart';

import 'http_client_services.dart';
import 'package:bitacoras/core/utils/utils.dart';

class HttpClientServiceImpl extends HttpClientService {

  late final Dio _dio;

  HttpClientServiceImpl(this._dio) {
    _dio
    ..options.baseUrl         = Environments.pathUrl
    ..options.connectTimeout  = const Duration( minutes: 5 )
    ..options.receiveTimeout  = const Duration( minutes: 5 )
    ..options.responseType    = ResponseType.json;
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
