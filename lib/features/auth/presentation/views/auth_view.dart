import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/presentation/presentation.dart';

class AuthView extends StatelessWidget {

  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 600,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: LayoutConstants.paddingXL,
              vertical  : LayoutConstants.paddingM,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing : LayoutConstants.spaceXL,
              children: [
                
                // Logo
                LogoLogin(),
              
                SizedBox(height: LayoutConstants.spaceM),
              
                // Title
                TitleLogin(),
              
                Form(
                  key   : context.watch<FormLoginBloc>().state.globalKeyFormLogin,
                  child : Column(
                    spacing : LayoutConstants.spaceL,
                    children: [
                      //Input: email
                      InputEmail(),
            
                      //Input: password
                      InputPassword(),
                    ],
                  )
                ),
              
                // Button login
                ButtonLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
