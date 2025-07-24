import 'package:bitacoras/features/auth/domain/entities/login_entity.dart';
import 'package:bitacoras/features/auth/domain/entities/user_entity.dart';
import 'package:bitacoras/features/auth/infrastructure/dtos/login_dto.dart';

class LoginMapper {

  static LogInEntity dtoToEntity ( LogInDto data ) => LogInEntity(
    status  : data.status,
    message : data.message, 
    data    : UserEntity(
      token     : data.data?.token ?? '',
      idUser    : data.data?.idUser ?? 0,
      firstName : data.data?.firstName ?? '',
      lastName  : data.data?.lastName ?? '',
      email     : data.data?.email ?? '',
      active    : data.data?.active ?? false,
      avatarUrl : data.data?.avatarUrl ?? '',
      lastLogin : data.data?.lastLogin ?? DateTime.now(),
      createdAt : data.data?.createdAt ?? DateTime.now(),
      updatedAt : data.data?.updatedAt ?? DateTime.now(),
      menuList  : data.data?.menuList.map(( menuList ) {
        return MenuList(
          idMenu: menuList.idMenu,
          name  : menuList.name,
          route : menuList.route,
          icon  : menuList.icon,
        );
      }).toList() ?? [],
      rolesList : data.data?.rolesList.map((roleList) {
        return RolesList(
          idRoles : roleList.idRoles, 
          name    : roleList.name,
        );
      },).toList() ?? [],
    )
  );
  
}