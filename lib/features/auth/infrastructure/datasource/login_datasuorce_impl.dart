import 'dart:isolate';
import 'package:dio/dio.dart';

import 'package:bitacoras/core/services/services.dart';
import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/auth/infrastructure/dtos/dtos.dart';
import 'package:bitacoras/features/auth/config/constants/constants.dart';
import 'package:bitacoras/features/auth/domain/datasource/datasource.dart';

class LoginDatasourceImpl implements LoginDataSource {

  HttpClientService httpClient;

  LoginDatasourceImpl({
    HttpClientServiceImpl? httpClient,
  }): httpClient = httpClient ?? HttpClientServiceImpl();
  
  @override
  Future<(ErrorMessage?, LogInDto)> postLogin(String email, String password) async {
    try {

      final isolateResponse = await Isolate.run( () async {
        return await httpClient.postWithoutAuth(
          path: '/auth/singIn',
          data: {
            "email"   : "manu@live.com",
            "password": "asd123A"
          }
        );
      }, );
      
      return (null, LogInDto.fromMap(isolateResponse) );

    } on DioException catch (e) {

      final String code      = e.response?.data['status'] ?? (e.response?.data['code'] ?? 500);
      final String errorCode = e.response?.data['hint'] ?? (e.response?.data['error_code'] ?? 'Error');
      final String msg       = e.response?.data['message'] ?? (e.response?.data['msg'] ?? 'Algun Error');
      
      return ( ErrorMessage( code  : code, error_code: errorCode, msg  : msg ), loginError );
    }
  }

  
}
