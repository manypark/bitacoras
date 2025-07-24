import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/domain/entities/entities.dart';
import 'package:bitacoras/features/auth/domain/repositories/repositories.dart';
import 'package:bitacoras/features/auth/infrastructure/repositories/repositories.dart';

class LoginUserCase {

  final LoginRepository repository;

  LoginUserCase({
    LoginRepository? repository
  }): repository = repository ?? LoginRepositoryImpl();

  Future<(ErrorMessage?, LogInEntity)> call( String email, String password ) async {
    return await repository.postLogin(email, password);
  }
  
}
