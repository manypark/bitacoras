import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/shared/shared.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/presentation/views/views.dart';

class AuthScreen extends StatelessWidget {

  static const path = '/auth-screen';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return StackLoader(
      animate : context.watch<FormLoginBloc>().state.isLoading,
      child   : Scaffold(
        appBar: AppBar(),
        body  : AuthView(),
      ),
    );
  }
  
}
