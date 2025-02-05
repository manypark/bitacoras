import 'package:flutter/material.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/presentation/widgets/widgets.dart';

class AuthView extends StatelessWidget {

  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding : const EdgeInsets.symmetric( 
          horizontal: LayoutConstants.paddingXL,
          vertical  : LayoutConstants.paddingM,
        ),
        child   : Column(
          spacing           : LayoutConstants.spaceXL,
          crossAxisAlignment: CrossAxisAlignment.start,
          children          : const [
        
            // Logo
            LogoLogin(),

            SizedBox( height: LayoutConstants.spaceM ),
      
            // Title
            TitleLogin(),

            //Input: email
            InputEmail(),

            //Input: password
            InputPassword(),

            // Acept terms and conditions text
            CheckBoxTermsAndConditions(),

            // Button login
            ButtonLogin()
      
          ],
        ),
      ),
    );
  }

}
