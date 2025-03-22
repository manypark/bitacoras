import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/configs/configs.dart';
import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/menu/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/tasks/presentation/blocs/blocs.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory( (await getTemporaryDirectory()).path ),
  );

  serviceLocatorInit();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const BlocsProviders());
  });

}

class BlocsProviders extends StatelessWidget {

  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers : [
        BlocProvider(create: (context) => getIt<LoginBloc>(), ),
        BlocProvider(create: (context) => getIt<FormLoginBloc>(), ),
        BlocProvider(create: (context) => getIt<MenuBloc>(), ),
        BlocProvider(create: (context) => getIt<TasksBloc>(), ),
      ],
      child     : const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {

  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title       : 'Bitacoras',
      routerConfig: appRouter,
      theme       : AppTheme().getThemeLight(),
    );
  }
}
