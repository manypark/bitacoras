import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/menu/presentation/widgets/widgets.dart';
import 'package:bitacoras/features/menu/presentation/blocs/menu/menu_bloc.dart';

const List<Widget> pages = [
  Center(
    child: Text('Tareas'),
  ),
  Center(
    child: Text('Bitacoras'),
  ),
];

class MenuView extends StatelessWidget {

  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {

        final menuPositionState = state.menuList;
        final indexState = menuPositionState.firstWhere( (menu) => menu.position == true ).index;

        return Stack(
          children: [
            
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

            const Align(
              alignment : Alignment.bottomCenter,
              child     : Padding(
                padding : EdgeInsets.only( bottom: 40 ),
                child   : ToggleButtonNavigationBar(),
              )
            ),

          ],
        );
      },
    );
  }
}
