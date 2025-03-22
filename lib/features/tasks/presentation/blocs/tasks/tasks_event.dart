part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();
  @override
  List<Object> get props => [];
}

class LoadListTasks extends TasksEvent {

  final List<TasksEntity> listTasks;

  const LoadListTasks({ required this.listTasks });
  
  @override
  List<Object> get props => [listTasks];
}
