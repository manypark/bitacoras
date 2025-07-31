import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:bitacoras/core/core.dart';
import 'package:bitacoras/features/profile/presentation/widgets/dialogs/dialogs.dart';

class LogOutButton extends StatelessWidget {

  const LogOutButton({ super.key });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
    
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
    
            return LogOutSessionDialog(
              title     : '¿Seguro que quieres salir?',
              desription: 'Se perderan tus bitacoras que no has enviado.',
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
    ).fadeIn( animate: true, delay: Duration( milliseconds: 700 ) );
  }
}