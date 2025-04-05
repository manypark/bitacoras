import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/tasks/presentation/blocs/blocs.dart';

class UpdateTasksButton extends StatelessWidget {

  const UpdateTasksButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.sizeOf(context).height * 0.06,
      right: LayoutConstants.paddingL,
      child: BlocBuilder<TasksBloc, TasksState>(
        builder: (context, state) {

          final isLoading = state.isLoading;

          return ElevatedButton(
            onPressed : isLoading ? null: () => context.read<TasksBloc>().loadListTasks(),
            child     : AnimatedSize(
              duration: Duration(milliseconds: 300),
              curve   : Curves.easeInOut,
              child   : Row(
                children: [

                  AnimatedRotation(
                    turns: isLoading ? 1 : 0,
                    duration: Duration(seconds: 1),
                    curve: Curves.linear,
                    child: const Icon(Icons.refresh, color: Colors.white),
                  ),

                  if (!isLoading) SizedBox(width: LayoutConstants.spaceS),

                  if (!isLoading)
                    Text(
                      'Actualizar tareas',
                      style: GlobalFonts.paragraphBodyMediumRegular.copyWith(color: Colors.white)
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}