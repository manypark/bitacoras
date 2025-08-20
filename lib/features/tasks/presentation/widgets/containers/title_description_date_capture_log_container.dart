import 'package:flutter/material.dart';

import 'package:bitacoras/core/core.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';
import 'package:bitacoras/features/tasks/presentation/widgets/widgets.dart';

class TitleDescriptionDateAndCaptureLogContainer extends StatelessWidget {
  
  const TitleDescriptionDateAndCaptureLogContainer({
    super.key,
    required this.task,
  });

  final TasksResponseEntity task;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [
    
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing : LayoutConstants.spaceM,
            children: [
              Text( 
                task.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style   : GlobalFonts.paragraphBodyLargeBold,
              ),
              Text( 
                task.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style   : GlobalFonts.paragraphBodyMediumSemiBold.copyWith( color: Colors.grey )
              ),
              Text( 
                formatDateDayMonthAndYear( DateTime.parse( task.createdAt.toIso8601String() ) ), 
                style: GlobalFonts.paragraphBodySmallRegular.copyWith( color: Colors.blueAccent ),
              ),
            ],
          ),
        ),
    
        CaptureLogsButton( task : task ),
      ],
    );
  }
}