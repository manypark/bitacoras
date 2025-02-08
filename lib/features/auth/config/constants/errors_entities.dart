import 'package:bitacoras/features/auth/domain/entities/app_metadata_entity.dart';
import 'package:bitacoras/features/auth/domain/entities/user_entity.dart';
import 'package:bitacoras/features/auth/domain/entities/user_metadata_entity.dart';
import 'package:bitacoras/features/auth/infrastructure/dtos/login_dto.dart';

final loginError = LogInDto(
  accessToken: '',
  tokenType: '', 
  expiresIn: 0, 
  expiresAt: 0, 
  refreshToken: '',
  user: null
);

final userError = User(
  id: '',
  aud: '', 
  role: '', 
  email: '', 
  emailConfirmedAt: '', 
  phone: '', 
  confirmedAt: '', 
  lastSignInAt: '', 
  appMetadata: AppMetadata(provider: '', providers: []),
  userMetadata: UserMetadata(emailVerified: false),
  createdAt: '', 
  updatedAt: '', 
  isAnonymous: false
);