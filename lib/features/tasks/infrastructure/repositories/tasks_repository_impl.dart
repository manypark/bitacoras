import 'package:bitacoras/core/utils/error_message.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/infrastructure/mappers/mappers.dart';
import 'package:bitacoras/features/tasks/infrastructure/datasource/datasource.dart';

class TasksRepositoryImpl implements TasksRepository {

  final TasksDatasource datasource;

  TasksRepositoryImpl({
    TasksDatasource? datasource,
  }): datasource = datasource ?? TasksDatasourceImpl();

  @override
  Future<(ErrorMessage?, TasksEntity)> getTasksList( GetTasksModel getTasksReqDto ) async {
    final dto = GetTasksRequestMapper.modelToDto(getTasksReqDto);
    final (errorMessage, tasksDto) = await datasource.getTasksList(dto);
    return (errorMessage, ListTasksMapper.dtoToEntity(tasksDto) );
  }
  
}
