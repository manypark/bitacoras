import 'package:go_router/go_router.dart';

import 'package:bitacoras/features/tasks/presentation/screen/tasks_screen.dart';

final routeTasks = GoRoute(
  path    : '/tasks',
  builder : (context, state) => const TasksScreen(),
);