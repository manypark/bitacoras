import 'package:flutter/material.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/core/configs/configs.dart';

class InputEmail extends StatelessWidget {
  
  const InputEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing           : LayoutConstants.spaceS,
      children          : [
        Text(
          'Correo',
          style: GlobalFonts.paragraphBodyMediumBold,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration  : InputDecoration(
            hintText  : 'Tu correo',
            hintStyle : GlobalFonts.paragraphBodyMediumRegular.copyWith( color: Colors.grey ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide( color: Colors.grey )
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide( color: Colors.red.shade300 )
            )
          ),
        ),
      ],
    );
  }
}
