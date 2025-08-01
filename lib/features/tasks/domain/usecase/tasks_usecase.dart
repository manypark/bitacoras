import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/infrastructure/infrastructure.dart';

class TasksUseCase {

  final TasksRepository repository;

  TasksUseCase({
    TasksRepository? repository
  }): repository = repository ?? TasksRepositoryImpl();

  Future<( ErrorMessage?, TasksEntity )> call( GetTasksRequestDto getTasksReqDto ) async {
    return await repository.getTasksList(getTasksReqDto);
  }
  
}
