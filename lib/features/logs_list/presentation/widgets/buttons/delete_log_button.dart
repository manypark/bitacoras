// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/constants/constans.dart';
import 'package:bitacoras/features/logs_list/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/logs_list/presentation/widgets/dialog/dialog.dart';

class DeletelogButtonWidget extends StatelessWidget {

  final String idLog;

  const DeletelogButtonWidget({
    super.key,
    required this.idLog
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        
        final response = await showAdaptiveDialog(
          context: context, 
          builder: (context) => DeleteLogDialog(),
        );

        if(response) context.read<LogsListBloc>().deleteOneLogList(idLog);
      },
      icon  : Icon( Icons.close_rounded, color: Colors.white ),
      style : ButtonStyle(
        backgroundColor : WidgetStatePropertyAll( Colors.redAccent ),
        shape           : WidgetStatePropertyAll(
          RoundedRectangleBorder( borderRadius: BorderRadius.circular(LayoutConstants.spaceM) )
        ),
      )
    );
  }
}