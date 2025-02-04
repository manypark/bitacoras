import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/domain/entities/entities.dart';

abstract interface class LoginRepository {
  Future<(ErrorMessage, LogInEntitie)> postLogin( String email, String password );
}