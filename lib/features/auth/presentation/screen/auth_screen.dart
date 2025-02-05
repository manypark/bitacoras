import 'package:flutter/material.dart';
import 'package:bitacoras/features/auth/presentation/views/views.dart';
class AuthScreen extends StatelessWidget {

  static const path = '/auth-screen';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body  : AuthView(),
    );
  }
  
}
