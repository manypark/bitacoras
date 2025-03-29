import 'package:bitacoras/shared/shared.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/tasks/domain/domain.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {

  final _listTasks = TasksUseCase();

  TasksBloc() : super(TasksState()) {
    on<LoadListTasks>( _loadListTasksHandler );
    on<FailListTasks>( _failListTasksHandler );
  }

  Future<List<TasksEntity>> loadListTasks() async {

    failLoadListTasks( '', false );

    final ( err, responseListTasks ) = await _listTasks();

    add( LoadListTasks(listTasks: responseListTasks.listTasks) );

    if( err != null ) {
      failLoadListTasks( err.msg, true);
    }

    return responseListTasks.listTasks;

  }

  void failLoadListTasks( String msgError, bool hasError ) {
    add( 
      FailListTasks(
        hasError  : hasError,
        messageErr: msgError
      )
    );
  }

  void _loadListTasksHandler( LoadListTasks event, Emitter<TasksState> emit ) {
    emit(state.copyWith( listTasks: event.listTasks ) );
  }

  void _failListTasksHandler( FailListTasks event, Emitter<TasksState> emit ) {
    emit(
      state.copyWith( 
        hasError    : event.hasError,
        messageError: event.messageErr
      )
    );
  }

}
