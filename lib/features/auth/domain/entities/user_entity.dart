class UserEntity {

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
    final List<MenuList> menuList;
    final List<RolesList> rolesList;

    UserEntity({
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

    factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
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
        menuList: List<MenuList>.from(json["menuList"].map((x) => MenuList.fromJson(x))),
        rolesList: List<RolesList>.from(json["rolesList"].map((x) => RolesList.fromJson(x))),
    );

    Map<String, dynamic> toMap() => {
        "token": token,
        "idUser": idUser,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "active": active,
        "avatarUrl": avatarUrl,
        "lastLogin": lastLogin.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "menuList": List<dynamic>.from(menuList.map((x) => x.toMap())),
        "rolesList": List<dynamic>.from(rolesList.map((x) => x.toMap())),
    };

}

class MenuList {
  
    final int idMenu;
    final String name;
    final String route;
    final String icon;

    MenuList({
      required this.idMenu,
      required this.name,
      required this.route,
      required this.icon,
    });

    factory MenuList.fromJson(Map<String, dynamic> json) => MenuList(
      idMenu: json["idMenu"],
      name  : json["name"],
      route : json["route"],
      icon  : json["icon"],
    );

    Map<String, dynamic> toMap() => {
        "idMenu": idMenu,
        "name": name,
        "route": route,
        "icon": icon,
    };

}

class RolesList {
  
  final int idRoles;
  final String name;

  RolesList({
    required this.idRoles,
    required this.name,
  });

  factory RolesList.fromJson(Map<String, dynamic> json) => RolesList(
    idRoles : json["idRoles"],
    name    : json["name"],
  );

  Map<String, dynamic> toMap() => {
        "idRoles": idRoles,
        "name": name,
    };

}
