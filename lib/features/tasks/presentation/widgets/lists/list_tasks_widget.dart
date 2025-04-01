import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/presentation/blocs/blocs.dart';

class ListTasksWidget extends StatelessWidget {
  final List<TasksEntity> tasks;

  const ListTasksWidget({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.8,
      child: Stack(
        children: [
          
          SingleChildScrollView(
            child: Column(
              children: [
                ...tasks.map((task) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: LayoutConstants.paddingL,
                        vertical: LayoutConstants.paddingL),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.black12,
                              offset: Offset(0, 5))
                        ]),
                    child: InkWell(
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          task.title,
                          style: GlobalFonts.paragraphBodyLargeBold,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(task.description),
                            Chip(
                              label: Text(task.status,
                                  style: GlobalFonts.paragraphBodyMediumBold
                                      .copyWith(color: Colors.red.shade300)),
                              backgroundColor: Colors.red.shade100,
                              side: BorderSide.none,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          
          Positioned(
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
          ),
        ],
      ),
    );
  }
}
