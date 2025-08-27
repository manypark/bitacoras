import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/auth/domain/domain.dart';

class LoginRepositoryImpl implements LoginRepository {

  final LoginDataSource datasource;

  LoginRepositoryImpl({ required this.datasource });

  @override
  Future<(ErrorMessage?, LogInEntity)> postLogin(String email, String password) async {
    final (errorMessage, loginDto ) = await datasource.postLogin(email, password);
    return (errorMessage, loginDto );
  } 
}