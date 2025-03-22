import 'package:flutter/material.dart';

import 'package:bitacoras/features/tasks/presentation/views/views.dart';

class TasksScreen extends StatelessWidget {

  static String path = '/tasks-screen';

  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TasksView();
  }

}