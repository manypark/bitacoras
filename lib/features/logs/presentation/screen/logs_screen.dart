import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/logs/presentation/views/views.dart';

class LogsScreen extends StatelessWidget {

  static String path = '/logs-screen';

  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bitacora libre', style: GlobalFonts.paragraphBodyTitleRegular ),
        ),
        body: const LogsView(),
      ),
    );
  }

}