import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/constants/constans.dart';
import 'package:bitacoras/features/profile/presentation/widgets/widgets.dart';
import 'package:bitacoras/features/auth/presentation/blocs/login/login_bloc.dart';

class ProfileView extends StatelessWidget {

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {

    final userInfo = context.read<LoginBloc>().state.userLogin;

    return Padding(
      padding : const EdgeInsets.all( LayoutConstants.spaceXL ),
      child   : Column(
        spacing : LayoutConstants.spaceL,
        children: [
          
          ImageProfileContainer( avatarUrl: userInfo?.avatarUrl ?? '' ),
          
          FullNameAndRollText(userInfo: userInfo),

          SizedBox( height: LayoutConstants.marginXL ),

          NotificationsButton(),
      
          Divider( color: Colors.black ).fadeIn( animate: true, delay: Duration( milliseconds: 400 ) ),

          ChangeThemeButton(),

          Divider( color: Colors.black ).fadeIn( animate: true, delay: Duration( milliseconds: 600 ) ),

          LogOutButton(),
        ],
      ),
    );
  }
}