import 'package:dio/dio.dart';

import 'package:bitacoras/core/services/services.dart';
import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/config/constants/error_entity.dart';
import 'package:bitacoras/features/tasks/infrastructure/dtos/tasks_dto.dart';

class TasksDatasourceImpl implements TasksDatasource {

   HttpClientService httpClient;

  TasksDatasourceImpl({
    HttpClientServiceImpl? httpClient,
  }): httpClient = httpClient ?? HttpClientServiceImpl();

  @override
  Future<(ErrorMessage?, ListTasksDto)> getTasksList() async {
    try {

      final response = await httpClient.get( path: '/rest/v1/Tasks?select=task_id,company_id,title,description,status' );
      
      return (null, ListTasksDto.fromList(response) );
      
    } on DioException catch (e) {

      final String code         = e.response?.data['statusCode'] ?? (e.response?.data['code'] ?? '500');
      final String errorCode = e.response?.data['hint'] ?? (e.response?.data['error_code'] ?? 'Error');
      final String msg       = e.response?.data['message'] ?? (e.response?.data['msg'] ?? 'Error no controlado');
      
      return ( ErrorMessage( code  : code, error_code: errorCode, msg  : msg ), errTasks);
    }
    
  }
  
}