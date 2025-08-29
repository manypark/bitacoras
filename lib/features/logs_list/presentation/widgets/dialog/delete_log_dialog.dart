import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bitacoras/core/configs/configs.dart';

class DeleteLogDialog extends StatelessWidget {

  const DeleteLogDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      backgroundColor : Colors.white,
      title           : Text( '¿Eliminar bitacora?', style: GlobalFonts.paragraphBodyLargeRegular, textAlign: TextAlign.center, ),
      content         : Text( 'Estas seguro de eliminar la bitacora, no se podra recuperar.', style: GlobalFonts.paragraphBodyMediumRegular, textAlign: TextAlign.center, ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions         : [
        TextButton(
          onPressed : () => context.pop(true),
          child     : Text('Eliminar', style: GlobalFonts.paragraphBodyLargeRegular.copyWith(color: Colors.redAccent ),),
        ),

        TextButton(
          onPressed : () => context.pop(false),
          child     : Text('Cancelar', style: GlobalFonts.paragraphBodyLargeRegular.copyWith(color: Colors.blueAccent ),),
        ),
      ],
    );
  }
}