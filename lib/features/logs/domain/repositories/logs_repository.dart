import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/logs/domain/entities/entities.dart';
import 'package:bitacoras/features/logs/infrastructure/dtos/dtos.dart';

abstract interface class LogsRepository {
  Future<(ErrorMessage?, LogEntity)> postTaskLog( LogsRequestDto dataForm );
}