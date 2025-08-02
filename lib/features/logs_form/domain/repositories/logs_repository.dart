import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/logs_form/domain/entities/entities.dart';
import 'package:bitacoras/features/logs_form/infrastructure/dtos/dtos.dart';

abstract interface class LogsRepository {
  Future<(ErrorMessage?, LogEntity)> postTaskLog( LogsRequestDto dataForm );
}