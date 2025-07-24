import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/tasks/infrastructure/dtos/dtos.dart';

abstract interface class TasksDatasource {
  Future<(ErrorMessage?, TasksDto)> getTasksList( GetTasksRequestDto getTasksReqDto );
}