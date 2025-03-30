part of 'tasks_bloc.dart';

class TasksState extends ErrorClass {
  
  final List<TasksEntity> listTasks;

  const TasksState({
    this.listTasks = const [],
    super.hasError,
    super.messageError,
    super.isLoading,
  });

  TasksState copyWith({
    bool? hasError,
    bool? isLoading,
    String? messageError,
    List<TasksEntity>? listTasks,
  }) => TasksState(
    listTasks   : listTasks ?? this.listTasks,
    hasError    : hasError ?? this.hasError,
    messageError: messageError ?? this.messageError,
    isLoading   : isLoading ?? this.isLoading,
  );

  @override
  List<Object> get props => [listTasks, hasError, messageError, isLoading];


  static Map<String, dynamic> toMap( TasksState state ) {
    return <String, dynamic>{
      'listTasks': state.listTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      listTasks: List<TasksEntity>.from( (
          map['listTasks']
        ).map<TasksEntity>( (x) => TasksEntity.fromMap(x) ),
      ),
    );
  }
}
