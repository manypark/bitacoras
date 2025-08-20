import 'package:flutter/material.dart';

import 'package:bitacoras/core/core.dart';
import 'package:bitacoras/features/tasks/presentation/widgets/widgets.dart';
import 'package:bitacoras/features/logs_form/infrastructure/dtos/logs/logs.dart';

class TimeLogAndStatusWidget extends StatelessWidget {

  const TimeLogAndStatusWidget({
    super.key,
    required this.log,
  });

  final LogsRequestDto log;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: LayoutConstants.spaceM,
      children: [
    
        Icon( Icons.timer_outlined, size: 18, color: Colors.grey,),
    
        Text(
          formatDayMonthHour( log.dateCapturated ),
          style   : GlobalFonts.paragraphBodySmallRegular.copyWith(color: Colors.grey),
        ),
    
        Spacer(),
    
        CustomChip(
          text            : 'Capturada',
          backgroundColor : Colors.green.shade100,
          textColor       : Colors.green.shade300,
        ),
    
        // CountLogsChip( text:'Capturada' ),
      ],
    );
  }
}