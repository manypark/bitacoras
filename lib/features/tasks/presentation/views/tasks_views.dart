import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/range_dates/ranges_dates.dart';
import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/tasks/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/tasks/presentation/widgets/widgets.dart';
import 'package:bitacoras/features/tasks/infrastructure/dtos/requests/get_tasks_dto.dart';

class TasksView extends StatelessWidget {

  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers : [
        BlocProvider<LoginBloc>( create: (_) => LoginBloc() ),
        BlocProvider<TasksBloc>( create: (_) => TasksBloc() ),
        BlocProvider<RangeDatesBloc>( create: (_) => RangeDatesBloc() ),
      ],
      child     : Column(
        children: [

          RangeDatesWidget(),
          
          FutureBuilder(
            future: context.read<TasksBloc>().loadListTasks( 
              GetTasksRequestDto(
                idUserAssigned: context.read<LoginBloc>().state.userLogin?.idUser ?? 0,
                initDate      : context.read<RangeDatesBloc>().state.startDate.toIso8601String().split('T')[0],
                endDate       : context.read<RangeDatesBloc>().state.endDate.toIso8601String().split('T')[0],
              )
            ),
            builder: (context, snapshot) {
          
              if (snapshot.connectionState == ConnectionState.waiting || context.read<TasksBloc>().state.isLoading ) return Center(child: CircularProgressIndicator.adaptive());
          
              if (snapshot.hasError) return Center( child: Text('Error: ${snapshot.error.toString()}') );
          
              final hasError  = context.watch<TasksBloc>().state.hasError;
              final msgError  = context.watch<TasksBloc>().state.messageError;
              final listTasks = context.watch<TasksBloc>().state.tasks;
          
              if ( hasError && (listTasks.data?.isEmpty ?? false) ) return Center(child: Text(msgError));
          
              if ( listTasks.data?.isEmpty ?? false ) return Expanded( child: Center( child: Text('Lista vacía',  style: GlobalFonts.paragraphBodyLargeBold,) ) );
          
              return ListTasksWidget(tasks: listTasks);
            },
          ),
        ],
      ),
    );
  }
}
