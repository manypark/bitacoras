import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/logs_form/infrastructure/dtos/dtos.dart';

abstract interface class LogsDatasource {
  Future<(ErrorMessage?, LogsDto)> postTaskLog( LogsRequestDto dataForm );
}

