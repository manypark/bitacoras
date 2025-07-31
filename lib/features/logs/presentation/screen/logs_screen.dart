import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/logs/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/logs/presentation/views/views.dart';

class LogsScreen extends StatelessWidget {

  static String path = '/logs-screen';

  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () { FocusScope.of(context).unfocus(); },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(child: Text('Tarea:', style: GlobalFonts.paragraphBodyLargeSemiBold )),
              Expanded(flex:4, child: Text(context.read<TaksLogFormBloc>().state.nameTask, style: GlobalFonts.paragraphBodyLargeRegular )),
            ],
          ),
        ),
        body: const LogsView(),
      ),
    );
  }

}