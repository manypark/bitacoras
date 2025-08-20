import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/logs_form/infrastructure/dtos/logs/logs.dart';

class ConceptAndTasktitleTextWidget extends StatelessWidget {

  final LogsRequestDto log;
  
  const ConceptAndTasktitleTextWidget({
    super.key,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [
    
        Text(
          log.conceptText,
          style   : GlobalFonts.paragraphBodyLargeBold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
                              
        Text(
          log.taskTitle,
          style   : GlobalFonts.paragraphBodyMediumRegular,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}