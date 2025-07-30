import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs/domain/domain.dart';
import 'package:bitacoras/features/logs/infrastructure/infrastructure.dart';

class TasksLogsRepositoryImpl implements TasksLogsRepository {

  final TasksLogsDatasource datasource;

  TasksLogsRepositoryImpl({
    TasksLogsDatasource? datasource,
  }): datasource = datasource ?? TasksLogsDatasourceImpl();

  @override
  Future<(ErrorMessage?, TaskLogsResponseEntity)> postTaskLog(TaskLogsRequestDto dataForm) async {
    final (errorMessage, taskLogDto ) = await datasource.postTaskLog(dataForm);
    return (errorMessage, TaskLogMapper.dtoToEntity(taskLogDto) );
  }
  
}
