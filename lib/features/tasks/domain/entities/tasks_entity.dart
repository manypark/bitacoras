import 'package:bitacoras/shared/entities/entities.dart';

class TasksEntity  extends GeneralEntity<List<TasksResponseEntity>> {

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

    factory TasksResponseEntity.fromJson(Map<String, dynamic> json) => TasksResponseEntity(
        createdAt   : DateTime.parse(json["createdAt"]),
        updatedAt   : DateTime.parse(json["updatedAt"]),
        idTasks     : json["idTasks"],
        title       : json["title"],
        description : json["description"],
        active      : json["active"],
        logsCount   : json["logsCount"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt"   : createdAt.toIso8601String(),
        "updatedAt"   : updatedAt.toIso8601String(),
        "idTasks"     : idTasks,
        "title"       : title,
        "description" : description,
        "active"      : active,
        "logsCount"   : logsCount,
    };

  }