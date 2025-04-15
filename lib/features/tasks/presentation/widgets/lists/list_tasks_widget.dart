import 'package:flutter/material.dart';

import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/presentation/widgets/containers/containers.dart';
import 'package:bitacoras/features/tasks/presentation/widgets/buttons/buttons.dart';

class ListTasksWidget extends StatelessWidget {
  final List<TasksEntity> tasks;

  const ListTasksWidget({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width : double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.75,
      child : Stack(
        children: [
          
          SingleChildScrollView(
            child: Column(
              children: [
                ...tasks.map( (task) => TasksListContainer( task: task ) ),
              ],
            ),
          ),
          
          const UpdateTasksButton(),

        ],
      ),
    );
  }
}