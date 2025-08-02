import 'services_locator.dart';

import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/tasks/infrastructure/infrastructure.dart';

void registerTaskDependencies() {
  // Repositorio
  getIt.registerLazySingleton<TasksRepository>(() => TasksRepositoryImpl());
  // UseCase
  getIt.registerLazySingleton(() => TasksUseCase( repository: getIt<TasksRepository>() ) );
  // Bloc
  getIt.registerSingleton<TasksBloc>( TasksBloc(tasksUseCase: getIt<TasksUseCase>() ) );
}