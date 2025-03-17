part of 'menu_bloc.dart';

sealed class MenuEvent extends Equatable {
  const MenuEvent();
  @override
  List<Object> get props => []; 
}

class LoadMenuList extends MenuEvent {

  final List<MenuEntity> menuList;

  LoadMenuList(): menuList = [
    MenuEntity(
        index   : 0,
        position: true,
        text    : 'Tareas',
      ),

      MenuEntity(
        index   : 1,
        position: false,
        text    : 'Bitacoras',
      ),
  ];

  @override
  List<Object> get props => [menuList]; 
  
}

class SelectMenuIndex extends MenuEvent {

  final int index;

  const SelectMenuIndex({
    required this.index,
  });

  @override
  List<Object> get props => [index]; 

}
