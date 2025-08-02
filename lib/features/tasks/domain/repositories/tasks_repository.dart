import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/tasks/domain/models/models.dart';
import 'package:bitacoras/features/tasks/domain/entities/entities.dart';

abstract interface class TasksRepository {
  Future<(ErrorMessage?, TasksEntity)> getTasksList( GetTasksModel getTasksReqDto );
}