import 'package:flutter/material.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/core/configs/configs.dart';

class InputPassword extends StatelessWidget {
  
  const InputPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing           : LayoutConstants.spaceS,
      children          : [
        Text(
          'Contraseña',
          style: GlobalFonts.paragraphBodyMediumBold,
        ),
        TextFormField(
          // keyboardType: TextInputType.visiblePassword,
          obscureText : true,
          decoration  : InputDecoration(
            // remove_red_eye_outlined
            suffixIcon: Icon( Icons.visibility_off_outlined ),
            hintText  : 'Tu contraseña',
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
