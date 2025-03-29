import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/infrastructure/dtos/dtos.dart';

class ListTasksMapper {

  static ListTasksEntity dtoToEntity(ListTasksDto data) {

    return ListTasksEntity(
      listTasks: data.listTasks.map((e) => TasksEntity(
          taskId      : e.taskId,
          companyId   : e.companyId,
          title       : e.title,
          description : e.description,
          status      : e.status,
        )
      ).toList(),
    );
  }
}