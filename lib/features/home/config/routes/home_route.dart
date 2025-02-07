import 'package:go_router/go_router.dart';

import 'package:bitacoras/features/home/presentation/screen/home_creen.dart';

final routeHome = GoRoute(
  path    : '/home',
  builder : (context, state) => const HomeScreen(),
);