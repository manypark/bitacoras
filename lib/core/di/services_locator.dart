import 'package:get_it/get_it.dart';

import 'tasks_injection.dart';
import 'package:bitacoras/features/menu/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/tasks/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/logs_form/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/logs_list/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/profile/presentation/cubits/theme_cubit/theme_cubit.dart';

final getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerLazySingleton<LoginBloc>( () => LoginBloc() );
  getIt.registerSingleton( FormLoginBloc() );
  getIt.registerSingleton( MenuBloc() );
  getIt.registerSingleton( RangeDatesBloc() );
  getIt.registerSingleton( ThemeCubit() );
  getIt.registerSingleton( TaksLogFormBloc() );
  getIt.registerSingleton( ConceptsBloc() );
  getIt.registerSingleton( LogsListBloc() );
  getIt.registerSingleton( UploadImageLogBloc() );

  registerTaskDependencies();
}
