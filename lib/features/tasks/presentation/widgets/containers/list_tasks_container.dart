import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/logs/presentation/blocs/blocs.dart';
import 'package:go_router/go_router.dart';

class TasksListContainer extends StatelessWidget {

  final TasksEntity task;

  const TasksListContainer({ 
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding : EdgeInsets.all(LayoutConstants.paddingL),
      width   : double.infinity,
      margin  : EdgeInsets.symmetric(
        horizontal: LayoutConstants.paddingL,
        vertical  : LayoutConstants.paddingL
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color       : Colors.white,
          boxShadow   : [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black12,
              offset: Offset(0, 5)
            )
          ]
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children          : [
    
            Row(
              children: [
    
                Chip(
                  label: Text(
                    task.status,
                    style: GlobalFonts.paragraphBodyMediumBold.copyWith(color: Colors.red.shade300)
                  ),
                  backgroundColor: Colors.red.shade100,
                  side: BorderSide.none,
                ),
    
                Spacer(),
    
                IconButton(
                  onPressed : () {
                    context.read<TaksLogFormBloc>().selectIdTask(task.taskId);
                    context.push('/logs');
                  },
                  icon      : Icon( Icons.add ),
                  style     : ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(LayoutConstants.spaceM),
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      )
                    ),
                  ),
                )
              ],
            ),
    
            SizedBox( height:LayoutConstants.spaceL ),
    
            Text(
              task.title,
              style: GlobalFonts.paragraphBodyLargeBold,
            ),
    
            SizedBox( height:LayoutConstants.spaceL ),
            
            Text(task.description),

            SizedBox( height:LayoutConstants.spaceL ),
            
            Text( formatDateDayMonthAndYear( DateTime.parse(task.createdAt) ), style: GlobalFonts.paragraphBodySmallUnderline, ),
            
          ],
        ),
    );
  }
}
