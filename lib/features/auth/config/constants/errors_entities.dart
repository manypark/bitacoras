import 'package:bitacoras/features/auth/domain/entities/entities.dart';

final loginError = LogInEntity(
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