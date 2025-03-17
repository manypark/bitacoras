import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/menu/domain/entities/entities.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {

  MenuBloc() : super( const MenuState() ) {
    on<LoadMenuList>(_loadMenuListHanlder);
    on<SelectMenuIndex>(_selectedIndexHandler);
  }

  void loadMenuList() {
    add(LoadMenuList());
  }

  Future<void> selectedIndex( int value ) async {
    add(SelectMenuIndex(index: value));
  }

  void _loadMenuListHanlder( LoadMenuList event, Emitter<MenuState> emit ) {
    emit( state.copyWith(menuList: event.menuList) );
  }

  void _selectedIndexHandler(SelectMenuIndex event, Emitter<MenuState> emit) {
    
  final newMenuList = state.menuList.map((e) {

    return MenuEntity(
      index   : e.index,
      text    : e.text,
      position: e.index == event.index,
    );

  }).toList();

  emit( state.copyWith( menuList:newMenuList) );
}

  
}
