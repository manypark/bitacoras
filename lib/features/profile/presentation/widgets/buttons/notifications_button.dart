import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:bitacoras/core/core.dart';

class NotificationsButton extends StatelessWidget {

  const NotificationsButton({ super.key });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () { },
      child: Row(
        spacing : LayoutConstants.spaceL,
        children: [
          Chip(
            backgroundColor: Colors.purple.shade100,
            side  : BorderSide.none,
            label : Icon( Icons.notifications_on_sharp, color: Colors.purple.shade500, ),
          ),
          Text('Notificaciones', style: GlobalFonts.paragraphBodyLargeRegular ,)
        ],
      ),
    ).fadeIn( animate: true, delay: Duration( milliseconds: 400 ) );
  }
}