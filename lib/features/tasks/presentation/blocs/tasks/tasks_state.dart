part of 'tasks_bloc.dart';

class TasksState extends Equatable {

  final List<TasksEntity> listTasks;

  const TasksState({
    this.listTasks = const []
  });
  
  @override
  List<Object> get props => [listTasks];

  TasksState copyWith({
    List<TasksEntity>? listTasks,
  }) => TasksState(
    listTasks: listTasks ?? this.listTasks,
  );

}
