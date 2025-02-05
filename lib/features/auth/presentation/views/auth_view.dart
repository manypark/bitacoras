import 'package:flutter/material.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/core/configs/configs.dart';
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
          children          : [
        
            // Logo
            Center(
              child: Container(
                height    : 120,
                width     : 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Colors.grey.shade300
                ),
              ),
            ),

            SizedBox( height: LayoutConstants.spaceM ),
      
            // Title
            Text(
              'Iniciar sesión',
              style: GlobalFonts.paragraphBodyTitleRegular,
            ),

            //Input: email
            InputEmail(),

            //Input: password
            InputPassword(),

            // Acept terms and conditions text
            CheckBoxTermsAndConditions()

            // Button login

      
          ],
        ),
      ),
    );
  }

}
