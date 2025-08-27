import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/domain/entities/entities.dart';

abstract interface class LoginDataSource {
  Future<(ErrorMessage?, LogInEntity)> postLogin( String email, String password );
}