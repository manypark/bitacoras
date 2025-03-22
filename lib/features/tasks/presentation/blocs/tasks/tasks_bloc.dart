import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/tasks/domain/domain.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {

  final _listTasks = TasksUseCase();

  TasksBloc() : super(TasksState()) {
    on<LoadListTasks>(_loadListTasksHandler);
  }

  Future<List<TasksEntity>> loadListTasks() async {

    final ( err, responseListTasks ) = await _listTasks();

    add(LoadListTasks(listTasks: responseListTasks.listTasks));

    return responseListTasks.listTasks;

  }

  void _loadListTasksHandler( LoadListTasks event, Emitter<TasksState> emit ) {
    emit(state.copyWith( listTasks: event.listTasks ) );
  }

}
