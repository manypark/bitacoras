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
      emailConfirmedAt: data.user?.emailConfirmedAt ?? DateTime.now(),
      phone: data.user?.phone ?? '', 
      confirmedAt: data.user?.confirmedAt ?? DateTime.now(), 
      lastSignInAt: data.user?.lastSignInAt ?? DateTime.now(), 
      appMetadata: AppMetadata(provider: '', providers: []),
      userMetadata: UserMetadata(emailVerified: false), 
      identities: [], 
      createdAt: data.user?.createdAt ?? DateTime.now(), 
      updatedAt: data.user?.updatedAt ?? DateTime.now(), 
      isAnonymous: data.user?.isAnonymous ?? false
    )
  );
  
}