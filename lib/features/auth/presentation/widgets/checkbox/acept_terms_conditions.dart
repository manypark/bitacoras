import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/theme/fonts/fonts_global.dart';
import 'package:bitacoras/features/auth/config/constants/constants.dart';

class CheckBoxTermsAndConditions extends StatelessWidget {

  const CheckBoxTermsAndConditions({ super.key });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      enableFeedback: true,
      checkboxScaleFactor: 1.2,
      checkboxShape: CircleBorder(),
      contentPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        termnsAndConditions,
        style: GlobalFonts.paragraphBodyMediumBold,
      ),
      value: true,
      activeColor: Colors.black,
      checkColor: Colors.white,
      onChanged: (bool? value) { },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
