import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/logs_form/infrastructure/dtos/logs/logs.dart';

class LogDescriptionTextWidget extends StatelessWidget {

  final LogsRequestDto log;
  
  const LogDescriptionTextWidget({
    super.key,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      log.description,
      style   : GlobalFonts.paragraphBodySmallRegular.copyWith(color: Colors.grey),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}