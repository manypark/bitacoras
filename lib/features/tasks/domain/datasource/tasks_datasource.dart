import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';

abstract interface class TasksDatasource {
  Future<(ErrorMessage?, TasksEntity)> getTasksList( GetTasksModel getTasksReqModel );
}