import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/infrastructure/dtos/dtos.dart';

abstract interface class LoginDataSource {
  Future<(ErrorMessage?, LogInDto)> postLogin( String email, String password );
}