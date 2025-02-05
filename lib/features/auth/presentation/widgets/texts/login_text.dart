import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/auth/config/constants/constants.dart';

class TitleLogin extends StatelessWidget {

  const TitleLogin({ super.key });

  @override
  Widget build(BuildContext context) {
    return Text(
      titleLogin,
      style: GlobalFonts.paragraphBodyTitleRegular,
    );
  }
}

