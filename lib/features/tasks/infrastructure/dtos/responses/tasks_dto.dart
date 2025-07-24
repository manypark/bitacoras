import 'package:bitacoras/shared/entities/entities.dart';

class TasksDto  extends GeneralEntity<List<TasksResponseDto>> {

  TasksDto({
    required super.status, 
    required super.message, 
    required super.data,
  });

  factory TasksDto.fromMap( Map<String, dynamic> map ) {
    return TasksDto(
      status  : map['status'], 
      message : map['message'], 
      data    : map['data'] != null ? List<TasksResponseDto>.from(map["data"].map((x) => TasksResponseDto.fromJson(x))) : null,
    );
  }
  
}

  class TasksResponseDto {

    final DateTime createdAt;
    final DateTime updatedAt;
    final int idTasks;
    final String title;
    final String description;
    final bool active;
    final int logsCount;

    TasksResponseDto({
        required this.createdAt,
        required this.updatedAt,
        required this.idTasks,
        required this.title,
        required this.description,
        required this.active,
        required this.logsCount,
    });

    factory TasksResponseDto.fromJson(Map<String, dynamic> json) => TasksResponseDto(
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