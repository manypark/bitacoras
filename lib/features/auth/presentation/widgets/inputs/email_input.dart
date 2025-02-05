import 'package:bitacoras/features/auth/config/constants/constants.dart';
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
          email,
          style: GlobalFonts.paragraphBodyMediumBold,
        ),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration  : InputDecoration(
            hintText  : hintTextEmail,
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
