import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:bitacoras/core/configs/theme/fonts/fonts_global.dart';
import 'package:bitacoras/features/auth/domain/entities/user_entity.dart';

class FullNameAndRollText extends StatelessWidget {

  final UserEntity? userInfo;
  
  const FullNameAndRollText({
    super.key,
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children          : [

              Text(
                '${userInfo?.firstName ?? 'N/A'} ${userInfo?.lastName ?? 'N/A'}', 
                style: GlobalFonts.paragraphBodyLargeSemiBold,
              ).fadeIn( animate: true, delay: Duration( milliseconds: 200 ) ),

              Text(
                userInfo?.email ?? '',
                style: GlobalFonts.paragraphBodyLargeRegular.copyWith( color: Colors.grey ),
              ).fadeIn( animate: true, delay: Duration( milliseconds: 200 ) ),

            ],
          )
        ),
    
        if( userInfo?.rolesList.isNotEmpty ?? false )
        ...userInfo!.rolesList.map((e) => Chip(
            color : WidgetStatePropertyAll(Colors.redAccent),
            side  : BorderSide.none,
            label : Text( e.name.toUpperCase(), style: GlobalFonts.paragraphBodySmallBold.copyWith( color: Colors.white ), )
          ).fadeIn( animate: true, delay: Duration( milliseconds: 200 ) )
        ),        
      ],
    );
  }
}