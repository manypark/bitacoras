import 'package:dio/dio.dart';

import 'package:bitacoras/core/services/services.dart';
import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/infrastructure/dtos/dtos.dart';
import 'package:bitacoras/features/tasks/config/constants/error_entity.dart';

class TasksDatasourceImpl implements TasksDatasource {

   HttpClientService httpClient;

  TasksDatasourceImpl({
    HttpClientServiceImpl? httpClient,
  }): httpClient = httpClient ?? HttpClientServiceImpl();

  @override
  Future<(ErrorMessage?, TasksDto)> getTasksList( GetTasksRequestDto getTasksReqDto ) async {
    try {

      final endDate         = getTasksReqDto.endDate;
      final initDate        = getTasksReqDto.initDate;
      final idUserAssigned  = getTasksReqDto.idUserAssigned;

      final response = await httpClient.get( path: '/tasks/by-user?idUserAssigned=$idUserAssigned&startDate=$initDate&endDate=$endDate' );
      
      return (null, TasksDto.fromMap(response) );
      
    } on DioException catch (e) {

      final dynamic code = e.response?.data['status']?? e.response?.data['statusCode'] ?? '500';
      final dynamic msg  = e.response?.data['message'] ?? 'Error no controlado';
      
      return ( ErrorMessage( code  : code.toString(), error_code: '500', msg  : msg.toString() ), errTasks);
    }
    
  }
  
}