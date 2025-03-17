import 'package:flutter/material.dart';

import 'package:bitacoras/features/menu/presentation/views/views.dart';

class MenuScreen extends StatelessWidget {

  static String path = '/menu-screen';

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold( body: MenuView() );

}
