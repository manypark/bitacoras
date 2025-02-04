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
      
      final response = await httpClient.post(path: '/auth/v1/token?grant_type=password');
      
      return (null, LogInDto.fromMap(response) );

    } on Exception catch (e) {
      return (
        ErrorMessage(
          code      : 400,
          error_code: e.toString(), 
          msg       : e.toString()
        ),
        loginError
      );
    }
  }

  
}
