import 'package:dio/dio.dart';

import 'package:bitacoras/core/services/services.dart';
import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/infrastructure/infrastructure.dart';
import 'package:bitacoras/features/tasks/config/constants/error_entity.dart';

class TasksDatasourceImpl implements TasksDatasource {

   HttpClientService httpClient;

  TasksDatasourceImpl({
    HttpClientServiceImpl? httpClient,
  }): httpClient = httpClient ?? HttpClientServiceImpl();

  @override
  Future<(ErrorMessage?, TasksEntity)> getTasksList( GetTasksModel getTasksReqModel ) async {
    try {

      final endDate         = getTasksReqModel.endDate;
      final initDate        = getTasksReqModel.initDate;
      final idUserAssigned  = getTasksReqModel.idUserAssigned;

      final response = await httpClient.get( path: '/tasks/by-user?idUserAssigned=$idUserAssigned&startDate=$initDate&endDate=$endDate' );

      final tasksListEntity = ListTasksMapper.dtoToEntity(response);
      
      return ( null, tasksListEntity );
      
    } on DioException catch (e) {

      final dynamic code = e.response?.data['status']?? e.response?.data['statusCode'] ?? '500';
      final dynamic msg  = e.response?.data['message'] ?? 'Error no controlado';
      
      return ( 
        ErrorMessage( code  : code.toString(), error_code: '500', msg : msg.toString() ), 
        errTasks
      );
    }
    
  }
  
}