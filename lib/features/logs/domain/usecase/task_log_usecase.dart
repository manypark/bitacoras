import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs/domain/domain.dart';
import 'package:bitacoras/features/logs/infrastructure/infrastructure.dart';

class TaskLogUsecase {

  final TasksLogsRepository repository;

  TaskLogUsecase({
    TasksLogsRepository? repository,
  }): repository = repository ?? TasksLogsRepositoryImpl();

  Future<(ErrorMessage?, TaskLogsResponseEntity)> call( TaskLogsRequestDto dataForm ) async {
    return await repository.postTaskLog(dataForm);
  }
  
}
