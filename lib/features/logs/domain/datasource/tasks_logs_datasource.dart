import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/logs/infrastructure/dtos/dtos.dart';

abstract interface class TasksLogsDatasource {
  Future<(ErrorMessage?, TaskLogsResponseDto)> postTaskLog( TaskLogsRequestDto dataForm );
}