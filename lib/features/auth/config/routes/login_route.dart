import 'package:go_router/go_router.dart';
import 'package:bitacoras/features/auth/presentation/screen/screen.dart';

final routeLogin = GoRoute(
  path    : '/auth',
  builder : (context, state) => const AuthScreen(),
);