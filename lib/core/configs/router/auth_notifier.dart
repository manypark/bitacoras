import 'dart:async';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:flutter/foundation.dart';

enum AuthStatus { checking, authenticated, unauthenticated }

class GoRouterNotifier extends ChangeNotifier {

  final LoginBloc loginBloc;
  late final StreamSubscription<LoginState> _subscription;
  AuthStatus _authStatus;

  GoRouterNotifier({required this.loginBloc}): _authStatus = (loginBloc.state.userLogin != null && loginBloc.state.userLogin?.id != '')
            ? AuthStatus.authenticated
            : AuthStatus.unauthenticated {

    // Se suscribe al stream del bloc para escuchar cambios en el estado
    _subscription = loginBloc.stream.listen((state) {

      print(state);

      final newStatus = ( state.userLogin != null && state.userLogin!.id.isNotEmpty )
          ? AuthStatus.authenticated
          : AuthStatus.unauthenticated;
      if (newStatus != _authStatus) {

        _authStatus = newStatus;
        notifyListeners();
      }

    });
  }

  AuthStatus get authStatus => _authStatus;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
