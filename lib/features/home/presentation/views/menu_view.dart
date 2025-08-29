import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/shared/shared.dart';
import 'package:bitacoras/features/tasks/presentation/presentation.dart';
import 'package:bitacoras/features/logs_list/presentation/screen/screen.dart';
import 'package:bitacoras/features/home/presentation/blocs/menu/menu_bloc.dart';

const List<Widget> pages = [
  TasksScreen(),
  LogsListScreen(),
];

class MenuView extends StatelessWidget {

  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {

      final menuPositionState = context.watch<MenuBloc>().state.menuList;
      final indexState = menuPositionState.firstWhere((menu) => menu.position == true).index;

      return Stack(
        clipBehavior: Clip.none,
        children    : [
          
          ...pages.asMap().map((index, page) {
            return MapEntry(index, AnimatedPositioned(
              duration: const Duration(milliseconds: 0),
              top     : indexState == index ? 0 : MediaQuery.of(context).size.height,
              left    : 0,
              right   : 0,
              bottom  : 0,
              child   : page,
            ));
          },).values,
        
          Align(
            alignment : Alignment.bottomCenter, 
            child     : ClipPath(
              clipper   : CustomNavBarClipper(),
              child     : Container(
                height    : 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only( 
                      topLeft : Radius.elliptical(180, 30),
                      topRight: Radius.elliptical(180, 30),
                    ),
                    color       : Colors.white,
                  ),
                child : Row(
                  mainAxisAlignment : MainAxisAlignment.spaceAround,
                  children          : [
          
                    IconButton(
                      icon      : Icon(
                        Icons.task, 
                        color : (indexState == 0) ? Colors.blue : Colors.grey,
                        size  : 36,
                      ),
                      onPressed : () async {
                        await context.read<MenuBloc>().selectedIndex(0);
                      },
                    ),
          
                    const SizedBox(width: 20), // Espacio para el botón central
          
                    IconButton(
                      icon      : Icon(
                        Icons.list_alt, 
                        color : (indexState == 1) ? Colors.blue : Colors.grey,
                        size  : 36,
                      ),
                      onPressed : () async {
                        await context.read<MenuBloc>().selectedIndex(1);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
}