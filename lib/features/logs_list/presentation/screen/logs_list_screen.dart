import 'package:flutter/material.dart';

import '../views/views.dart';

class LogsListScreen extends StatelessWidget {

  const LogsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitacoras'),
      ),
      body  : LogsListView(),
    );
  }
}