import 'package:bitacoras/features/auth/domain/entities/user_entity.dart';
import 'package:bitacoras/features/auth/domain/entities/login_entity.dart';
import 'package:bitacoras/features/auth/domain/entities/user_metadata_entity.dart';
import 'package:bitacoras/features/auth/infrastructure/dtos/login_dto.dart';
import 'package:bitacoras/features/auth/domain/entities/app_metadata_entity.dart';

class LoginMapper {

  static LogInEntitie dtoToEntity ( LogInDto data ) => LogInEntitie(
    accessToken : data.accessToken, 
    tokenType   : data.tokenType,
    expiresIn   : data.expiresAt,
    expiresAt   : data.expiresIn,
    refreshToken: data.refreshToken,
    user        : User(
      id: data.user?.id ?? '', 
      aud: data.user?.aud ?? '', 
      role: data.user?.role ?? '', 
      email: data.user?.email ?? '', 
      emailConfirmedAt: data.user?.emailConfirmedAt ?? '',
      phone: data.user?.phone ?? '', 
      confirmedAt: data.user?.confirmedAt ?? '', 
      lastSignInAt: data.user?.lastSignInAt ?? '', 
      appMetadata: AppMetadata(provider: '', providers: []),
      userMetadata: UserMetadata(emailVerified: false), 
      createdAt: data.user?.createdAt ?? '', 
      updatedAt: data.user?.updatedAt ?? '', 
      isAnonymous: data.user?.isAnonymous ?? false
    )
  );
  
}