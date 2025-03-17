import 'package:go_router/go_router.dart';
import 'package:bitacoras/features/splash/presentation/screen/splash_screen.dart';

final splashRoute = GoRoute(
  path    : '/splash',
  builder : (context, state) => const SplashScreen(),
);