// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class FailListTasks extends TasksEvent {

  final bool hasError;
  final String messageErr;

  const FailListTasks({
    required this.hasError,
    required this.messageErr,
  });

  @override
  List<Object> get props => [hasError, messageErr];
  
}
