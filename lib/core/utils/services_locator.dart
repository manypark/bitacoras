import 'package:get_it/get_it.dart';

import 'package:bitacoras/features/menu/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/tasks/presentation/blocs/blocs.dart';

final getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerLazySingleton<LoginBloc>( () => LoginBloc() );
  getIt.registerSingleton( FormLoginBloc() );
  getIt.registerSingleton( MenuBloc() );
  getIt.registerSingleton( TasksBloc() );
  getIt.registerSingleton( RangeDatesBloc() );
}
