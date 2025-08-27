import 'package:bitacoras/features/auth/domain/entities/entities.dart';

class LoginMapper {

  static LogInEntity dtoToEntity ( Map<String, dynamic> json ) => LogInEntity(
    status  : json['status'],
    message : json['message'], 
    data    : UserEntity(
      token     : json['data']['token'],
      idUser    : json['data']['idUser'],
      firstName : json['data']['firstName'],
      lastName  : json['data']['lastName'],
      email     : json['data']['email'],
      active    : json['data']['active'],
      avatarUrl : json['data']['avatarUrl'],
      lastLogin : DateTime.parse( json['data']['lastLogin'] ),
      createdAt : DateTime.parse( json['data']['createdAt'] ),
      updatedAt : DateTime.parse( json['data']['updatedAt'] ),
      menuList  : List<MenuList>.from(json['data']["menuList"].map((x) => MenuList.fromJson(x))),
      rolesList : List<RolesList>.from(json['data']["rolesList"].map((x) => RolesList.fromJson(x))),
    )
  );
  
}