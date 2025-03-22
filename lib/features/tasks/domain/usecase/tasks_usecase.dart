import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/infrastructure/infrastructure.dart';

class TasksUserCase {

  final TasksRepository repository;

  TasksUserCase({
    TasksRepository? repository
  }): repository = repository ?? TasksRepositoryImpl();

  Future<(ErrorMessage?, ListTasksEntity)> call() async {
    return await repository.getTasksList();
  }
  
}
