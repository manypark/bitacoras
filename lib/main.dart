import 'package:flutter/material.dart';

import 'core/configs/configs.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
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
