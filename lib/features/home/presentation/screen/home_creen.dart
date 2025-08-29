import 'package:flutter/material.dart';

import 'package:bitacoras/features/home/presentation/views/views.dart';

class HomeScreen extends StatelessWidget {
  static const path = '/home-screen';
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => const MenuView();
}