import 'package:go_router/go_router.dart';
import 'package:bitacoras/features/logs_form/presentation/screen/screen.dart';

final logsRoute = GoRoute(
  path    : '/logs',
  builder : (context, state) => const LogsScreen(),
); 