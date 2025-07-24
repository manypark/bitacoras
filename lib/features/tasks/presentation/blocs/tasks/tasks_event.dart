part of 'tasks_bloc.dart';

sealed class TasksEvent extends Equatable {
  const TasksEvent();
  @override
  List<Object> get props => [];
}

class LoadListTasks extends TasksEvent {

  final TasksEntity tasks;

  const LoadListTasks({ 
    this.tasks = const TasksEntity( status: false, message: '', data: [] ),
  });
  
  @override
  List<Object> get props => [tasks];

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
