import 'package:go_router/go_router.dart';

import 'package:bitacoras/features/splash/configs/route.dart';
import 'package:bitacoras/features/auth/config/routes/routes.dart';
import 'package:bitacoras/features/home/config/routes/routes.dart';
import 'package:bitacoras/features/menu/config/routes/menu_route.dart';

  final appRouter = GoRouter(

    initialLocation : '/splash',
    routes          : [
      splashRoute,
      menuRoute,
      routeLogin,
      routeHome,
    ],
  );