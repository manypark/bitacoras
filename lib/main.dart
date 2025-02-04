import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/configs/configs.dart';
import 'package:bitacoras/core/utils/utils.dart';
import 'features/auth/presentation/blocs/login/login_bloc.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  serviceLocatorInit();

  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {

  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers : [
        BlocProvider(create: (context) => getIt<LoginBloc>(), ),
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
