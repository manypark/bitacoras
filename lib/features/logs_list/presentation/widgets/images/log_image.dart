import 'dart:io';
import 'package:flutter/material.dart';

import 'package:bitacoras/core/utils/constants/constans.dart';
import 'package:bitacoras/features/logs_form/infrastructure/dtos/logs/logs.dart';

class ImageLogWidget extends StatelessWidget {

  final LogsRequestDto log;
  
  const ImageLogWidget({
    super.key,
    required this.log,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(LayoutConstants.spaceL),
      child       : Image.file(
        File(log.imageUrl),
        errorBuilder: (context, error, stackTrace) {
          if(log.imageUrl.contains('https')) return Image.network(log.imageUrl, width : 60, height: 60, fit : BoxFit.cover,);
          return Icon( Icons.error, size:42 );
        },
        width : 60,
        height: 60,
        fit   : BoxFit.cover,
      ),
    );
  }
}