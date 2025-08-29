import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/presentation/screen/screen.dart';

final routeLogin = GoRoute(
  path    : '/auth',
  builder : (context, state) => BlocProvider(
    create: (context) => getIt<FormLoginBloc>(),
    child : const AuthScreen(),
  ),
);