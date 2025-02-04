import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitacoras/features/auth/presentation/blocs/login/login_bloc.dart';
class AuthScreen extends StatelessWidget {

  static const path = '/auth-screen';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed : () {
            context.read<LoginBloc>().postLogin("manypark@live.com", 'developerPerron2019.');
          },
          child     : Text('Aceptar')
        ),
      ),
    );
  }
}
