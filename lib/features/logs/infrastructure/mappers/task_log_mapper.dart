import 'package:bitacoras/features/logs/domain/domain.dart';
import 'package:bitacoras/features/logs/infrastructure/dtos/dtos.dart';

class TaskLogMapper {
  
  static TaskLogsResponseEntity dtoToEntity ( TaskLogsResponseDto data ) => TaskLogsResponseEntity(
    taskLogId : data.taskLogId, 
    message   : data.message,
  );
  
}