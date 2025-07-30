import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bitacoras/features/tasks/presentation/views/views.dart';

class TasksScreen extends StatelessWidget {

  static String path = '/tasks-screen';

  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title   : Text('Tareas del día'),
        actions : [
          IconButton(
            onPressed : () => context.push('/profile'),
            icon      : Icon( Icons.person, size: 36, ),
          )
        ],
      ),
      body  : const TasksView(),
    );
  }

}