import 'package:flutter/material.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/presentation/widgets/widgets.dart';

class TasksListContainer extends StatelessWidget {

  final TasksResponseEntity task;

  const TasksListContainer({ 
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : EdgeInsets.all(LayoutConstants.paddingL),
      child   : Material(
        elevation   : 6,
        shadowColor : Colors.black45,
        borderRadius: BorderRadius.circular(20),
        child       : Padding(
          padding : EdgeInsets.all(LayoutConstants.paddingL),
          child   : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children          : [
              
                TitleDescriptionDateAndCaptureLogContainer(task: task),

                Divider( height: LayoutConstants.spaceXL ),
          
                Row(
                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                  children          : [

                    Text('ID: ${task.idTasks}', style: GlobalFonts.paragraphBodyLargeSemiBold ,),
              
                    if(task.logsCount > 0 ) CustomChip( 
                      text            : 'Bitacoras: ${task.logsCount}',
                      backgroundColor : Colors.green.shade100,
                      textColor       : Colors.green.shade300,
                    ),
          
                    if(task.logsCount == 0 ) CountsWithoutLogs(),
                  ],
                ),            
              ],
            ),
        ),
      ),
    );
  }
}