import 'package:flutter/material.dart';

import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/core/utils/constants/layout_constans.dart';
import 'package:bitacoras/features/tasks/presentation/widgets/containers/containers.dart';

class ListTasksWidget extends StatelessWidget {

  final List<TasksResponseEntity> tasks;

  const ListTasksWidget({ super.key, required this.tasks, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width : double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.7,
      child : Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children          : [
                ...tasks.map( (task) => TasksListContainer( task: task ) ),
                SizedBox( height:LayoutConstants.spaceL * 6 ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}