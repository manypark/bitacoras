// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/shared/toast/toast.dart';
import 'package:bitacoras/shared/progres/progres.dart';
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

        if(logUpdated.imageUrl.isEmpty) {
          ToastificationAdapter().showErrorToast(
            context : context, 
            title   : 'Error al subir la imagen',
          );
          return;
        }

        final taskLogErr = await context.read<LogsListBloc>().uploadTaskLog(logUpdated);

        if(taskLogErr != null) {
          ToastificationAdapter().showErrorToast(
            context : context, 
            title   : taskLogErr.msg,
          );
          return;
        }

        ToastificationAdapter().showSuccessToast(
          context : context, 
          title   : 'Bitacora subida correctamente',
        );
      },
      icon: !context.watch<UploadImageLogBloc>().state.isLoading ? Icon( Icons.cloud_upload_outlined, color: Colors.white ) : 
      CircularProgress( color: Colors.white ),
      style : ButtonStyle(
        backgroundColor : WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) return Colors.grey.shade400;
          return Colors.blueAccent;
        },),
        shape : WidgetStatePropertyAll(
          RoundedRectangleBorder( borderRadius: BorderRadius.circular(LayoutConstants.spaceM), )
        ),
      )
    );
  }
}