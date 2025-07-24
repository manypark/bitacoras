import 'package:bitacoras/core/utils/utils.dart';
import '../../infrastructure/dtos/requests/get_tasks_dto.dart';
import 'package:bitacoras/features/tasks/domain/entities/entities.dart';

abstract interface class TasksRepository {
  Future<(ErrorMessage?, TasksEntity)> getTasksList( GetTasksRequestDto getTasksReqDto );
}