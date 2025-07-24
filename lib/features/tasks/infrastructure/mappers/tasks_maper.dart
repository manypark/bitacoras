import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/infrastructure/dtos/dtos.dart';

class ListTasksMapper {

  static TasksEntity dtoToEntity( TasksDto data ) {

    return TasksEntity(
      status  : data.status,
      message : data.message,
      data    : data.data?.map( (task) {
        return TasksResponseEntity(
          createdAt   : task.createdAt,
          updatedAt   : task.updatedAt,
          idTasks     : task.idTasks,
          title       : task.title,
          description : task.description,
          active      : task.active,
          logsCount   : task.logsCount,
        );
      },).toList() ?? [],
    );
  }
}