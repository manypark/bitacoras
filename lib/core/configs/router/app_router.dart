import 'package:go_router/go_router.dart';

import 'package:bitacoras/features/splash/configs/route.dart';
import 'package:bitacoras/features/auth/config/routes/routes.dart';
import 'package:bitacoras/features/home/config/routes/routes.dart';
import 'package:bitacoras/features/tasks/config/routes/routes.dart';
import 'package:bitacoras/features/logs_form/config/routes/routes.dart';
import 'package:bitacoras/features/menu/config/routes/menu_route.dart';
import 'package:bitacoras/features/logs_list/config/routes/routes.dart';
import 'package:bitacoras/features/profile/config/routes/profile_route.dart';

  final appRouter = GoRouter(

    initialLocation : '/splash',
    routes          : [
      routeSplash,
      routeMenu,
      routeLogin,
      routeHome,
      routeTasks,
      routeProfile,
      logsRoute,
      logsListRoute,
    ],
  );