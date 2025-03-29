part of 'tasks_bloc.dart';

class TasksState extends ErrorClass {
  
  final List<TasksEntity> listTasks;

  const TasksState({
    this.listTasks = const [],
    super.hasError,
    super.messageError,
  });

  TasksState copyWith({
    bool? hasError,
    String? messageError,
    List<TasksEntity>? listTasks,
  }) => TasksState(
    listTasks   : listTasks ?? this.listTasks,
    hasError    : hasError ?? this.hasError,
    messageError: messageError ?? this.messageError,
  );

  @override
  List<Object> get props => [listTasks, hasError, messageError];

}
