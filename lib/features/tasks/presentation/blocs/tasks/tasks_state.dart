part of 'tasks_bloc.dart';

class TasksState extends ErrorClass {
  
  final TasksEntity tasks;

  const TasksState({
    this.tasks = const TasksEntity(status: false, message: '', data: []),
    super.hasError,
    super.messageError,
    super.isLoading,
  });

  TasksState copyWith({
    bool? hasError,
    bool? isLoading,
    String? messageError,
    TasksEntity? tasks,
  }) =>
      TasksState(
        tasks: tasks ?? this.tasks,
        hasError: hasError ?? this.hasError,
        messageError: messageError ?? this.messageError,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [tasks, hasError, messageError, isLoading];

  static Map<String, dynamic> toMap(TasksState state) {
    return <String, dynamic>{
      'tasks': {
        'status': state.tasks.status,
        'message': state.tasks.message,
        'data': state.tasks.data?.map( (x) => {
          "createdAt"   : x.createdAt.toIso8601String(),
          "updatedAt"   : x.updatedAt.toIso8601String(),
          "idTasks"     : x.idTasks,
          "title"       : x.title,
          "description" : x.description,
          "active"      : x.active,
          "logsCount"   : x.logsCount,
        }).toList() ?? [],
      },
      'hasError': state.hasError,
      'messageError': state.messageError,
      'isLoading': state.isLoading,
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      tasks: TasksEntity(
        status: map['tasks']['status'] as bool,
        message: map['tasks']['message'] as String,
        data: List<TasksResponseEntity>.from( (map['tasks']['data'] as List<dynamic>).map((x) =>
            TasksResponseDto.fromJson(x).toEntity()
          ),
        ),
      ),
      hasError: map['hasError'] as bool? ?? false,
      messageError: map['messageError'] as String? ?? '',
      isLoading: map['isLoading'] as bool? ?? false,
    );
  }
}
