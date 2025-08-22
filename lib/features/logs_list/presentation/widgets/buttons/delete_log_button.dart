import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/constants/constans.dart';
import 'package:bitacoras/features/logs_list/presentation/blocs/blocs.dart';

class DeletelogButtonWidget extends StatelessWidget {

  final String idLog;

  const DeletelogButtonWidget({
    super.key,
    required this.idLog
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<LogsListBloc>().deleteOneLogList(idLog),
      icon: Icon( Icons.close_rounded, color: Colors.white ),
      style     : ButtonStyle(
        backgroundColor : WidgetStatePropertyAll( Colors.redAccent ),
        shape           : WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(LayoutConstants.spaceM),
          )
        ),
      )
    );
  }
}