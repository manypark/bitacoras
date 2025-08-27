class UserDto {

    final String token;
    final int idUser;
    final String firstName;
    final String lastName;
    final String email;
    final bool active;
    final String avatarUrl;
    final DateTime lastLogin;
    final DateTime createdAt;
    final DateTime updatedAt;
    final List<MenuListDto> menuList;
    final List<RolesListDto> rolesList;

    UserDto({
        required this.token,
        required this.idUser,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.active,
        required this.avatarUrl,
        required this.lastLogin,
        required this.createdAt,
        required this.updatedAt,
        required this.menuList,
        required this.rolesList,
    });

    factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        token: json["token"],
        idUser: json["idUser"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        active: json["active"],
        avatarUrl: json["avatarUrl"],
        lastLogin: DateTime.parse(json["lastLogin"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        menuList: List<MenuListDto>.from(json["menuList"].map((x) => MenuListDto.fromJson(x))),
        rolesList: List<RolesListDto>.from(json["rolesList"].map((x) => RolesListDto.fromJson(x))),
    );

}

class MenuListDto {
  
    final int idMenu;
    final String name;
    final String route;
    final String icon;

    MenuListDto({
        required this.idMenu,
        required this.name,
        required this.route,
        required this.icon,
    });

    factory MenuListDto.fromJson(Map<String, dynamic> json) => MenuListDto(
        idMenu: json["idMenu"],
        name  : json["name"],
        route : json["route"],
        icon  : json["icon"],
    );
}

class RolesListDto {
    final int idRoles;
    final String name;

    RolesListDto({
      required this.idRoles,
      required this.name,
    });

    factory RolesListDto.fromJson(Map<String, dynamic> json) => RolesListDto(
      idRoles : json["idRoles"],
      name    : json["name"],
    );

}