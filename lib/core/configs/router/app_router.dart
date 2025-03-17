import 'package:go_router/go_router.dart';

import 'package:bitacoras/features/auth/config/routes/routes.dart';
import 'package:bitacoras/features/home/config/routes/routes.dart';
import 'package:bitacoras/features/splash/presentation/screen/splash_screen.dart';

  final appRouter = GoRouter(

    initialLocation : '/splash',
    routes          : [
      GoRoute(
        path    : '/splash',
        builder : (context, state) => const SplashScreen(),
      ),
      routeLogin,
      routeHome,
    ],
  );