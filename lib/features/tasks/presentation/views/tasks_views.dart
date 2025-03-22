import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/tasks/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/tasks/presentation/widgets/widgets.dart';

class TasksView extends StatelessWidget {

  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future  : context.read<TasksBloc>().loadListTasks(),
      builder : (context, snapshot) {

        if( snapshot.connectionState == ConnectionState.waiting ) return Center( child: CircularProgressIndicator.adaptive() );

        if( snapshot.hasError ) return Center( child: Text('Error: ${snapshot.error.toString()}'),);

        if( snapshot.hasData ) {

          final tasks = snapshot.data ?? [];

          if (tasks.isEmpty) {
            return Center( child: Text('Lista vacia'),);
          }

          return ListTasksWidget(tasks: tasks);
        }

        return Container();

      },
    );
  }

}
