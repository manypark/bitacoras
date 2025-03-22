import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/tasks/presentation/blocs/blocs.dart';

class TasksView extends StatelessWidget {

  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future  : context.read<TasksBloc>().loadListTasks(),
      builder : (context, snapshot) {

        if( snapshot.connectionState == ConnectionState.waiting ) {
          return Center( child: CircularProgressIndicator.adaptive() );
        }

        if(snapshot.hasError) {
          return Center( child: Text('Error: ${snapshot.error.toString()}'),);
        }

        if( snapshot.hasData ) {

          if (snapshot.data!.isEmpty) {
            return Center( child: Text('Lista vacia'),);
          }

          return ListView.builder(
            itemCount   : snapshot.data?.length ?? 0,
            itemBuilder : (context, index) {

              final tasks = snapshot.data![index];

              return ListTile(
                title   : Text(tasks.title),
                subtitle: Text(tasks.description),
              );
            },
          );
        }

        return Container();

      },
    );
  }

}