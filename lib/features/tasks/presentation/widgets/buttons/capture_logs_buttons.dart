import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/tasks/domain/entities/entities.dart';
import 'package:bitacoras/features/logs_form/presentation/blocs/blocs.dart';

class CaptureLogsButton extends StatelessWidget {

  final TasksResponseEntity task;

  const CaptureLogsButton({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed : () {
        context.read<TaksLogFormBloc>().selectIdTask(task.idTasks);
        context.read<TaksLogFormBloc>().selectNameTask(task.title);
        context.push('/logs');
      },
      icon      : Row(
        spacing: LayoutConstants.spaceM,
        children: [
          Icon( Icons.camera_alt_outlined, color: Colors.white, size: 18, ),
          Text('Capturar', style: GlobalFonts.paragraphBodyMediumSemiBold.copyWith( color : Colors.white ) ,),
        ],
      ),
      style     : ButtonStyle(
        backgroundColor: WidgetStatePropertyAll( Colors.blueAccent ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(LayoutConstants.spaceM),
          )
        ),
      ),
    );
  }
}