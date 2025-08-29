import 'package:bitacoras/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/views.dart';
import 'package:bitacoras/features/logs_list/presentation/blocs/blocs.dart';

class LogsListScreen extends StatelessWidget {
  
  const LogsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitacoras'),
        surfaceTintColor: Colors.transparent,
      ),
      body: BlocProvider(
        create: (context) => getIt<UploadImageLogBloc>(),
        child: LogsListView(),
      ),
    );
  }
}
