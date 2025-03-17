import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/menu/presentation/blocs/blocs.dart';

class ToggleButtonNavigationBar extends StatelessWidget {

  const ToggleButtonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    final color = AppTheme().getThemeDark();

    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {

        final menuState = state;

        return ToggleButtons(
          onPressed: (int index) async {
              await context.read<MenuBloc>().selectedIndex(index);
          },
          borderRadius        : const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor : Colors.black,
          selectedColor       : Colors.white,
          fillColor           : color.colorScheme.primary,
          color               : Colors.black,
          constraints: BoxConstraints(
            minHeight : 40.0,
            minWidth  : ( MediaQuery.sizeOf(context).width * 0.3 ),
          ),
          isSelected          : menuState.menuList.map((e) => e.position).toList(),
          children            : menuState.menuList.map((e) => Text(e.text)).toList(),
        );
      },
    );
  }
}
