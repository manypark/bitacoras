part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();
  @override
  List<Object> get props => [];
}

class LoadListTasks extends TasksEvent {

  final List<TasksEntity> listTasks;

  const LoadListTasks({ 
    this.listTasks = const [],
  });
  
  @override
  List<Object> get props => [listTasks];

}

class LoadingListTasks extends TasksEvent {

  final bool isLoading;

  const LoadingListTasks({
    this.isLoading = false,
  });

  @override
  List<Object> get props => [isLoading];
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
