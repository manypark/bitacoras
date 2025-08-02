import 'package:go_router/go_router.dart';

import '../../presentation/screen/screen.dart';

final logsListRoute = GoRoute(
  path    : '/logs_list',
  builder : (context, state) => const LogsListScreen(),
); 