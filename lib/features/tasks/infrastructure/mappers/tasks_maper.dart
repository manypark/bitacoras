import 'package:bitacoras/features/tasks/domain/domain.dart';

class ListTasksMapper {

  static TasksEntity dtoToEntity(Map<String, dynamic> json) {

    return TasksEntity(
      status  : json['status'] ?? false,
      message : json['message'] ?? '',
      data    : json['data']?.map<TasksResponseEntity>((task) {
        return TasksResponseEntity(
          createdAt   : DateTime.parse(task['createdAt']),
          updatedAt   : DateTime.parse(task['updatedAt']),
          idTasks     : task['idTasks'],
          title       : task['title'],
          description : task['description'],
          active      : task['active'],
          logsCount   : task['logsCount'],
        );
      }).toList() ?? [],
    );
  }
}
