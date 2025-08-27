import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/domain/domain.dart';

class LoginUserCase {

  final LoginRepository repository;

  LoginUserCase({ required this.repository });

  Future<(ErrorMessage?, LogInEntity)> call( String email, String password ) async {
    return await repository.postLogin(email, password);
  }
}