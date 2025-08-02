import 'package:flutter/material.dart';

import '../views/views.dart';
import 'package:bitacoras/core/configs/theme/fonts/fonts_global.dart';

class LogsListScreen extends StatelessWidget {

  const LogsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitacoras', style: GlobalFonts.paragraphBodyLargeSemiBold ,),
      ),
      body  : LogsListView(),
    );
  }
}