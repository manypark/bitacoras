import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs/domain/domain.dart';
import 'package:bitacoras/features/logs/infrastructure/infrastructure.dart';

class TaskLogUsecase {

  final LogsRepository repository;

  TaskLogUsecase({
    LogsRepository? repository,
  }): repository = repository ?? LogsRepositoryImpl();

  Future<(ErrorMessage?, LogEntity)> call( LogsRequestDto dataForm ) async {
    return await repository.postTaskLog(dataForm);
  }
  
}
