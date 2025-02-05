import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';

class TitleLogin extends StatelessWidget {

  const TitleLogin({ super.key });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Iniciar sesión',
      style: GlobalFonts.paragraphBodyTitleRegular,
    );
  }
}

