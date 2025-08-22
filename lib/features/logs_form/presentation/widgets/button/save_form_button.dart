// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/logs_form/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/logs_list/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/logs_form/infrastructure/infrastructure.dart';

class SaveFormButton extends StatelessWidget {

  final double height;

  const SaveFormButton({ super.key, required this.height, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : EdgeInsets.only(bottom: height * 0.06),
      child   : SizedBox(
        height: 50,
        width : double.infinity,
        child : ElevatedButton(
          onPressed : () async {

            final savedLog = await context.read<TaksLogFormBloc>().submitTaksLog();

            context.read<LogsListBloc>().addLogToList( 
              LogsRequestDto(
                description : savedLog.description, 
                imageUrl    : savedLog.pathImage, 
                latitud     : savedLog.latitud,
                longitud    : savedLog.longitud, 
                idUser      : context.read<LoginBloc>().state.userLogin?.idUser ?? 0, 
                idTasks     : savedLog.idTask, 
                idConcept   : savedLog.idOptionConcept,
                conceptText : savedLog.conceptText,
                taskTitle   : savedLog.nameTask,
                idLog       : DateTime.now().millisecond.toString(),
                dateCapturated: DateTime.now(),
              )
            );

            context.read<TaksLogFormBloc>().resetLogForm();

            final snackBar = SnackBar(
              backgroundColor: Colors.blueAccent,
              duration: Duration( seconds: 3 ),
              content : Text('Bitacora guardada con éxito', style: GlobalFonts.paragraphBodyLargeRegular.copyWith( color: Colors.white ), ) 
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            context.pop();
          },
          child     : Text( 'Guardar Bitacora', style: GlobalFonts.paragraphBodyMediumRegular .copyWith(color: Colors.white),
          ),
        ),
      ),
    ).fadeIn(delay: Duration(milliseconds: 400));
  }
}
