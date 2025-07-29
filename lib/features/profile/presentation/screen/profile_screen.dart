import 'package:flutter/material.dart';
import 'package:bitacoras/features/profile/presentation/views/views.dart';

class ProfileScreen extends StatelessWidget {

  static String path = '/profile-screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: const ProfileView(),
    );
  }
}