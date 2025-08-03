import 'package:bitacoras/shared/entities/entities.dart';

class TasksEntity extends GeneralEntity<List<TasksResponseEntity>> {
  const TasksEntity({
    required super.status, 
    required super.message, 
    required super.data,
  });
}

  class TasksResponseEntity {

    final DateTime createdAt;
    final DateTime updatedAt;
    final int idTasks;
    final String title;
    final String description;
    final bool active;
    final int logsCount;

    const TasksResponseEntity({
        required this.createdAt,
        required this.updatedAt,
        required this.idTasks,
        required this.title,
        required this.description,
        required this.active,
        required this.logsCount,
    });

  }