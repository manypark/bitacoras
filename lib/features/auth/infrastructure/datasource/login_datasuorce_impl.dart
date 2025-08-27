import 'dart:isolate';
import 'package:dio/dio.dart';

import 'package:bitacoras/core/services/services.dart';
import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/auth/domain/domain.dart';
import 'package:bitacoras/features/auth/config/constants/constants.dart';
import 'package:bitacoras/features/auth/infrastructure/infrastructure.dart';

class LoginDatasourceImpl implements LoginDataSource {

  HttpClientService httpClient;

  LoginDatasourceImpl({
    HttpClientServiceImpl? httpClient,
  }): httpClient = httpClient ?? HttpClientServiceImpl();
  
  @override
  Future<(ErrorMessage?, LogInEntity)> postLogin(String email, String password) async {
    try {

      final isolateResponse = await Isolate.run( () async {
        return await httpClient.postWithoutAuth(
          path: '/auth/singIn',
          data: {
            "email"   : email,
            "password": password
          }
        );
      }, );
      
      return (null, LoginMapper.dtoToEntity(isolateResponse) );

    } on DioException catch (e) {

      final String errorCode = e.response?.data['hint'] ?? (e.response?.data['error_code'] ?? 'Error');
      final String msg       = e.response?.data['message'] ?? (e.response?.data['msg'] ?? 'Algun Error');
      
      return ( ErrorMessage( error_code: errorCode, msg  : msg ), loginError );
    }
  }

  
}
