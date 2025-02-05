import 'package:go_router/go_router.dart';
import 'package:bitacoras/features/auth/config/routes/routes.dart';

final appRouter = GoRouter(

  initialLocation : '/auth',
  routes          : [
    routeLogin,
  ],
  redirect        : (context, state) {
    // Validacion de auth
    // if(true) routeLogin.path;
    return null;
  },
);