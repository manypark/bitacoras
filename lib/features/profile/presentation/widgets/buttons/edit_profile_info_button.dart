import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:bitacoras/core/core.dart';

class EditInfoProfileButton extends StatelessWidget {

  const EditInfoProfileButton({ super.key });

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
            label : Icon( Icons.person, color: Colors.purple.shade500, ),
          ),
          Text('Editar Información', style: GlobalFonts.paragraphBodyLargeRegular ,)
        ],
      ),
    ).fadeIn( animate: true, delay: Duration( milliseconds: 400 ) );
  }
}