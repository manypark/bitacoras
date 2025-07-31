import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:bitacoras/core/configs/configs.dart';

class ContainerSelectImage extends StatelessWidget {

  const ContainerSelectImage({ super.key });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius      : Radius.circular(12),
        color       : Colors.grey.shade400,
        strokeWidth : 1,
        dashPattern : [5, 3],
      ),
      child       : InkWell(
        onTap: () {
          
        },
        child: Container(
          width       : double.infinity,
          height      : 120,
          decoration  : BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color       : Colors.white,
          ),
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children          : [
          
              Icon( Icons.photo_camera, color: Colors.grey.shade600, size: 50 ),
        
              SizedBox( height: 8 ),
          
              Text(
                'Toma una fotografía desde tu camara', 
                style: GlobalFonts.paragraphBodyMediumRegular.copyWith( color: Colors.grey.shade600 )
              ),
            ],
          ),
        ),
      ),
    ).fadeIn( delay: Duration( milliseconds: 300 ) );
  }
}