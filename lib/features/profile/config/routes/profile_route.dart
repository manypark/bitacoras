import 'package:go_router/go_router.dart';

import 'package:bitacoras/features/profile/presentation/screen/profile_screen.dart';

final routeProfile = GoRoute(
  path    : '/profile',
  builder : (context, state) => const ProfileScreen(),
);