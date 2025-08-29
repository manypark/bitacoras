part of 'menu_bloc.dart';

class MenuState extends Equatable {

  final List<MenuEntity> menuList;

  const MenuState({
    this.menuList = const []
  });
  
  @override
  List<Object> get props => [menuList];

  MenuState copyWith({
    List<MenuEntity>? menuList,
  }) {
    return MenuState(
      menuList: menuList ?? this.menuList,
    );
  }
}

