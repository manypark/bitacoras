import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {

  static const path = '/auth-screen';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Auth Screen'),
      ),
    );
  }
}