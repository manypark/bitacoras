import 'package:bitacoras/features/auth/domain/entities/user_entity.dart';
import 'package:bitacoras/features/auth/infrastructure/dtos/login_dto.dart';

final loginError = LogInDto(
  status: false,
  message: '', 
  data: null
);

final userError = UserEntity(
  token: '', 
  idUser: 0,
  firstName: '', 
  lastName: '', 
  email: '', 
  active: false, 
  avatarUrl: '', 
  lastLogin: DateTime.now(), 
  createdAt: DateTime.now(), 
  updatedAt: DateTime.now(), 
  menuList: [], 
  rolesList: []
);