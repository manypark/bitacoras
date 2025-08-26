import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/constants/constans.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/logs_form/infrastructure/dtos/dtos.dart';
import 'package:bitacoras/features/logs_list/presentation/blocs/blocs.dart';

class UploadLogButtonWidget extends StatelessWidget {

    final LogsRequestDto log;

  const UploadLogButtonWidget({
    super.key,
    required this.log
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: context.watch<UploadImageLogBloc>().state.isLoading ? null : () async {
        final user = context.read<LoginBloc>().state.userLogin!;
        final logUpdated = await context.read<UploadImageLogBloc>().uploadLogWithImageFromCludinary(log, user);
        // ignore: avoid_print
        if(logUpdated.imageUrl.isEmpty) print('Error al subir la imagen');
        // ignore: use_build_context_synchronously
        if(logUpdated.imageUrl.isNotEmpty) context.read<LogsListBloc>().updateLogToList(logUpdated);
      },
      // icon: Icon( Icons.cloud_upload_outlined, color: Colors.white ),
      icon: !context.watch<UploadImageLogBloc>().state.isLoading ? Icon( Icons.cloud_upload_outlined, color: Colors.white ) : 
      CircularProgressIndicator(color: Colors.white, strokeWidth: 1,),
      style     : ButtonStyle(
        backgroundColor : WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
            return Colors.grey.shade400;
          }
          return Colors.blueAccent;
        },),
        shape           : WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(LayoutConstants.spaceM),
          )
        ),
      )
    );
  }
}