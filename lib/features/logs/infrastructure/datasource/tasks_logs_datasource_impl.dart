import 'package:bitacoras/core/services/services.dart';
import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/logs/domain/domain.dart';
import 'package:bitacoras/features/logs/infrastructure/infrastructure.dart';

class TasksLogsDatasourceImpl implements TasksLogsDatasource {

  HttpClientService httpClient;
  
  TasksLogsDatasourceImpl({
    HttpClientServiceImpl? httpClient,
  }): httpClient = httpClient ?? HttpClientServiceImpl();

  @override
  Future<(ErrorMessage?, TaskLogsResponseDto)> postTaskLog(TaskLogsRequestDto dataForm) async {
    try {

      final response = await httpClient.post(
        path: '/rest/v1/rpc/add_task_logs',
        data: dataForm.toMap()
      );
      
      return (null, TaskLogsResponseDto.fromMap(response) );

    } catch (e) {
      
      return (
        ErrorMessage(code: '500', error_code: e.toString(), msg: e.toString()), 
        TaskLogsResponseDto(message: '', taskLogId: '')
      );
    }
  }

}
