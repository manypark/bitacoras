import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs_form/domain/domain.dart';
import 'package:bitacoras/features/logs_form/infrastructure/infrastructure.dart';

class LogsRepositoryImpl implements LogsRepository {

  final LogsDatasource datasource;

  LogsRepositoryImpl({
    LogsDatasource? datasource,
  }): datasource = datasource ?? LogsDatasourceImpl();

  @override
  Future<(ErrorMessage?, LogEntity)> postTaskLog( LogsRequestDto dataForm ) async {
    final (errorMessage, taskLogDto ) = await datasource.postTaskLog(dataForm);
    return (errorMessage, LogMapper.dtoToEntity(taskLogDto) );
  }
  
}
