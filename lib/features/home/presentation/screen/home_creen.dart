import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const path = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final userEmail = context.watch<LoginBloc>().state.userLogin?.email;

    return Scaffold(
      body: Center(
        child: Text('Home screen: $userEmail'),
      ),
    );
  }
}
