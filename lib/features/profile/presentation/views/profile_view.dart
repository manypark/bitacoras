import 'package:bitacoras/features/profile/presentation/widgets/dialogs/dialogs.dart';
import 'package:bitacoras/shared/shared.dart';
import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/core/utils/constants/constans.dart';

class ProfileView extends StatelessWidget {

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : const EdgeInsets.all( LayoutConstants.spaceXL ),
      child   : Column(
        spacing : LayoutConstants.spaceL,
        children: [
      
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              
            },
            child: Row(
              spacing : LayoutConstants.spaceL,
              children: [
                Chip(
                  backgroundColor: Colors.purple.shade100,
                  side  : BorderSide.none,
                  label : Icon( Icons.person, color: Colors.purple.shade500, ),
                ),
                Text('Información', style: GlobalFonts.paragraphBodyLargeRegular ,)
              ],
            ),
          ),
      
          Divider( color: Colors.black ),
      
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {

              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {

                  return LogOutSessionDialog(
                    title     : '¿Seguro que quieres salir?',
                    desription: 'Se perderan tus bitacoras que no has enviado',
                  );
                },
              );

            },
            child: Row(
              spacing : LayoutConstants.spaceL,
              children: [
                Chip(
                  backgroundColor: Colors.blue.shade100,
                  side  : BorderSide.none,
                  label: Icon( Icons.logout_outlined, color: Colors.blue.shade500 )
                ),
                Text('Cerrar sesión', style: GlobalFonts.paragraphBodyLargeRegular ,)
              ],
            ),
          ),
      
        ],
      ),
    );
  }
}