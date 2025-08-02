import 'package:equatable/equatable.dart';
import 'package:bitacoras/shared/shared.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:bitacoras/features/tasks/domain/domain.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> with HydratedMixin {

  final TasksUseCase tasksUseCase;

  TasksBloc({
    required this.tasksUseCase
  }) : super(TasksState()) {
    hydrate();
    on<ResetTasks>( _resetTasksHandler );
    on<LoadListTasks>( _loadListTasksHandler );
    on<FailListTasks>( _failListTasksHandler );
    on<LoadingListTasks>( _loadingListTasksHandler );
  }

  Future<TasksEntity> loadListTasks( GetTasksModel getTasksReqDto ) async {

    failLoadListTasks( '', false );
    add( LoadingListTasks( isLoading: true ) );

    final ( err, tasksResponse ) = await tasksUseCase( getTasksReqDto );

    if( err != null ) {
      failLoadListTasks( err.msg, true);
      add( LoadingListTasks( isLoading:false ) );
      return TasksEntity(status: false, message: err.msg, data: []);
    }

    add( 
      LoadListTasks( 
        tasks : TasksEntity(
            status  : tasksResponse.status, 
            message : tasksResponse.message, 
            data    : tasksResponse.data,
          )
      )
    );
    
    add( LoadingListTasks( isLoading:false ) );

    return tasksResponse;

  }

  void failLoadListTasks( String msgError, bool hasError ) {
    add( 
      FailListTasks(
        hasError  : hasError,
        messageErr: msgError
      )
    );
  }

  void resetTasks() {
    add( ResetTasks() );
  }

// ################################ Handlers ################################

  void _loadListTasksHandler( LoadListTasks event, Emitter<TasksState> emit ) {
    emit( state.copyWith( tasks: event.tasks ) );
  }

  void _resetTasksHandler( ResetTasks event, Emitter<TasksState> emit ) {
    emit( state );
  }

  void _failListTasksHandler( FailListTasks event, Emitter<TasksState> emit ) {
    emit(
      state.copyWith( 
        hasError    : event.hasError,
        messageError: event.messageErr,
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
