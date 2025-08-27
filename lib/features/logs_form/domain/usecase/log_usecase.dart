import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs_form/domain/domain.dart';
import 'package:bitacoras/features/logs_form/infrastructure/infrastructure.dart';

class TaskLogUsecase {

  final LogsRepository repository;

  TaskLogUsecase({ required this.repository });

  Future<(ErrorMessage?, LogEntity)> call( LogsRequestDto dataForm ) async {
    return await repository.postTaskLog(dataForm);
  } 
}