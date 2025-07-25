import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/auth/domain/domain.dart';
import 'package:bitacoras/features/auth/infrastructure/mappers/mappers.dart';
import 'package:bitacoras/features/auth/infrastructure/datasource/datasource.dart';

class LoginRepositoryImpl implements LoginRepository {

  final LoginDataSource datasource;

  LoginRepositoryImpl({
    LoginDataSource? datasource,
  }): datasource = datasource ?? LoginDatasourceImpl();

  @override
  Future<(ErrorMessage?, LogInEntity)> postLogin(String email, String password) async {
    final (errorMessage, loginDto ) = await datasource.postLogin(email, password);
    return (errorMessage, LoginMapper.dtoToEntity(loginDto) );
  }
  
}
