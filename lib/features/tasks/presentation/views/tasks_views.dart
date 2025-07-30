import 'package:intl/intl.dart';
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
    return Column(
      children: [
    
        RangeDatesWidget(),
        
        FutureBuilder(
          future: context.read<TasksBloc>().loadListTasks( 
            GetTasksRequestDto(
              idUserAssigned: context.read<LoginBloc>().state.userLogin?.idUser ?? 0,
              initDate      : DateFormat('yyyy-MM-dd').format( context.read<RangeDatesBloc>().state.startDate ),
              endDate       : DateFormat('yyyy-MM-dd').format( context.read<RangeDatesBloc>().state.endDate ),
            )
          ),
          builder: (context, snapshot) {
        
            if ( snapshot.connectionState == ConnectionState.waiting || context.watch<TasksBloc>().state.isLoading ) { 
              return Center( child: CircularProgressIndicator.adaptive() );
            }
        
            if ( snapshot.hasError ) return Center( child: Text('Error: ${snapshot.error.toString()}') );
        
            final hasError  = context.watch<TasksBloc>().state.hasError;
            final msgError  = context.watch<TasksBloc>().state.messageError;
            final listTasks = context.watch<TasksBloc>().state.tasks.data;
        
            if ( hasError && (listTasks?.isEmpty ?? false ) ) return Center(child: Text(msgError));
        
            if ( listTasks?.isEmpty ?? false ) return Expanded( child: Center( child: Text('Lista vacía',  style: GlobalFonts.paragraphBodyLargeBold,) ) );
        
            return ListTasksWidget(tasks: listTasks!);
          },
        ),
      ],
    );
  }
}
