import 'package:dio/dio.dart';

abstract class HttpClientService {
  Future<dynamic> get({required String path, Options? options});
  Future<dynamic> delete({required String path, Options? options});
  Future<dynamic> put({required String path, required Map<String, dynamic> data, Options? options});
  Future<dynamic> post({required String path, Map<String, dynamic>? data, Options? options});
  Future<dynamic> postWithoutAuth({required String path, Map<String, dynamic>? data, Options? options});
}
