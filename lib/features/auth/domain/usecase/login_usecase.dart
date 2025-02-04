import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/domain/entities/entities.dart';
import 'package:bitacoras/features/auth/domain/repositories/repositories.dart';

class LoginUserCase {

  final LoginRepository repository;

  LoginUserCase({required this.repository});

  Future<(ErrorMessage, LogInEntitie)> call( String email, String password ) async {
    return await repository.postLogin(email, password);
  }
  
}
