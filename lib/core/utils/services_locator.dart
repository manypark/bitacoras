import 'package:get_it/get_it.dart';
import 'package:bitacoras/features/auth/presentation/blocs/login/login_bloc.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton( LoginBloc() );
}