import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';

class TasksUseCase {

  final TasksRepository repository;

  const TasksUseCase({ required this.repository, });

  Future<( ErrorMessage?, TasksEntity )> call( GetTasksModel getTasksReqModel ) async {
    return await repository.getTasksList(getTasksReqModel);
  }
  
}