import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/shared/shared.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import '../../../tasks/infrastructure/dtos/requests/get_tasks_dto.dart';
import 'package:bitacoras/features/tasks/presentation/presentation.dart';
import 'package:bitacoras/features/menu/presentation/blocs/menu/menu_bloc.dart';

const List<Widget> pages = [
  TasksScreen(),
  Center(
    child: Text('Bitacoras'),
  ),
];

class MenuView extends StatelessWidget {

  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {

      final menuPositionState = context.watch<MenuBloc>().state.menuList;
      final indexState = menuPositionState.firstWhere((menu) => menu.position == true).index;

      final startDate = context.watch<RangeDatesBloc>().state.startDate;
      final endDate   = context.watch<RangeDatesBloc>().state.endDate;

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
          
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.089,
            left  : MediaQuery.of(context).size.width / 2 - 30,
            child : FloatingActionButton(
              heroTag   : 'UpdateTasks',
              onPressed : context.watch<TasksBloc>().state.isLoading ? null : () => context.read<TasksBloc>().loadListTasks(
                GetTasksRequestDto(
                  idUserAssigned: context.read<LoginBloc>().state.userLogin?.idUser ?? 0,
                  initDate      : DateFormat('yyyy-MM-dd').format( startDate ),
                  endDate       : DateFormat('yyyy-MM-dd').format( endDate ),
                )
              ),
              backgroundColor : context.watch<TasksBloc>().state.isLoading ? Colors.grey : Colors.blueAccent,
              child           : AnimatedRotation(
                turns   : context.read<TasksBloc>().state.isLoading ? 1 : 0,
                duration: Duration(seconds: 1),
                curve   : Curves.linear,
                child   : const Icon(Icons.refresh, color: Colors.white),
              ),
            ),
          ),
        
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
