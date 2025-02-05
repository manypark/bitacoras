import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';

class ButtonLogin extends StatelessWidget {

  const ButtonLogin({ super.key });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius  : 35,
            spreadRadius: 0,
            color       : Colors.black45,
            offset      : Offset(0, 12),
          )
        ]
      ),
      height    : 60,
      width     : double.infinity,
      child     : ElevatedButton(
        onPressed : () { },
        style     : ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black)
        ),
        child     : Text(
          'Iniciar sesión',
          style: GlobalFonts.paragraphBodyLargeBold.copyWith( color: Colors.white ),
        ),
      ),
    );
  }
}
