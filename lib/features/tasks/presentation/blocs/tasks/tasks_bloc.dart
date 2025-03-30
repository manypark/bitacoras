import 'package:equatable/equatable.dart';
import 'package:bitacoras/shared/shared.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:bitacoras/features/tasks/domain/domain.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> with HydratedMixin {

  final _listTasks = TasksUseCase();

  TasksBloc() : super(TasksState()) {
    hydrate();
    on<LoadListTasks>( _loadListTasksHandler );
    on<FailListTasks>( _failListTasksHandler );
    on<LoadingListTasks>( _loadingListTasksHandler );
  }

  Future<List<TasksEntity>> loadListTasks() async {

    failLoadListTasks( '', false );
    add( LoadingListTasks( isLoading: true ) );

    await Future.delayed( const Duration( seconds: 2 ) );

    final ( err, responseListTasks ) = await _listTasks();

    if( err != null ) {
      failLoadListTasks( err.msg, true);
      return [];
    }

    add( LoadListTasks(listTasks:responseListTasks.listTasks) );
    add( LoadingListTasks( isLoading:false ) );

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

  void _loadingListTasksHandler( LoadingListTasks event, Emitter<TasksState> emit ) {
    emit(state.copyWith( isLoading: event.isLoading ) );
  }
  
  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return TasksState.toMap( state );
  }

}
