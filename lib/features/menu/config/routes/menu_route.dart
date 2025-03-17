import 'package:go_router/go_router.dart';
import 'package:bitacoras/features/menu/presentation/screen/screen.dart';

final menuRoute = GoRoute(
  path    : '/menu',
  builder : (context, state) => const MenuScreen(),
); 