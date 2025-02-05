import 'package:bitacoras/shared/widgets/input/inputs.dart';
import 'package:flutter/material.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/auth/config/constants/constants.dart';

class InputEmail extends StatelessWidget {
  
  const InputEmail({ super.key });

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
        InputGlobal(
          textInputType : TextInputType.emailAddress,
          hintText      : hintTextEmail,
        ),
      ],
    );
  }
}
