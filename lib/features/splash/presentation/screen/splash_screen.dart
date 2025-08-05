import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/menu/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/presentation/presentation.dart';
import 'package:bitacoras/features/logs_form/presentation/blocs/blocs.dart';

class SplashScreen extends StatefulWidget {

  static const path = '/splash-screen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {

    super.initState();

    // Obtén la instancia del bloc ya proveída en el árbol de widgets
    final loginBloc = BlocProvider.of<LoginBloc>(context);

    // Programar redirección después del build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = loginBloc.state.userLogin?.idUser ?? 0;
      if (state != 0 ) {
        context.read<MenuBloc>().loadMenuList();
        context.read<ConceptsBloc>().loadConceptList();
        context.go('/home');
      } else {
        context.go('/auth');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
