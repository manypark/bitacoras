import 'package:bitacoras/shared/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/core/utils/constants/layout_constans.dart';

class CustomDialog extends StatelessWidget {

  final String title;
  final String desription;
  final String pathImage;

  const CustomDialog({
    super.key, 
    required this.title, 
    required this.desription,
    required this.pathImage,
  });

  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor : Colors.white,
      shape           : RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.6,
        child : Padding(
          padding: EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.05),
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            mainAxisSize      : MainAxisSize.min,
            spacing           : LayoutConstants.spaceXL,
            children          : [

              if(pathImage != '')
              SvgPicture.asset(
                pathImage,
                width : MediaQuery.sizeOf(context).width * 0.4,
                height: MediaQuery.sizeOf(context).height * 0.27,
                semanticsLabel: 'Error imagen',
              ),

              Column(
                spacing : LayoutConstants.spaceL,
                children: [
                  Text(title.toUpperCase(), style: GlobalFonts.paragraphBodyLargeRegular,),
                  Text(desription, style: GlobalFonts.paragraphBodyMediumRegular),
                ],
              ),

              Spacer(),

              CustomButton(
                text    : 'Cerrar',
                onPress : () => context.pop(),
              )
          
            ],
          ),
        ),
      ),
    );
  }

}
