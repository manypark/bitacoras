import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/core/utils/constants/constans.dart';
import 'package:bitacoras/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:bitacoras/features/profile/presentation/widgets/dialogs/dialogs.dart';

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

          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular( 10 ),
            child       : SizedBox(
              width : double.infinity,
              height: 200,
              child : (userInfo?.avatarUrl != '' ) ?
              Image.network( 
                userInfo!.avatarUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon( Icons.person, size: 64, color: Colors.blueGrey.shade700, ), 
              ) : 
              Icon( Icons.person, size: 64, color: Colors.blueGrey.shade700, ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(child: Text( '${userInfo?.firstName ?? 'N/A'} ${userInfo?.lastName ?? 'N/A'}', style: GlobalFonts.paragraphBodyLargeSemiBold , )),

              if( userInfo?.rolesList.isNotEmpty ?? false )
              ...userInfo!.rolesList.map((e) => Chip(
                  color : WidgetStatePropertyAll(Colors.redAccent),
                  side  : BorderSide.none,
                  label : Text( e.name.toUpperCase(), style: GlobalFonts.paragraphBodySmallBold.copyWith( color: Colors.white ), )
                )
              ),

            ],
          ),
                    

          SizedBox( height: LayoutConstants.marginXL ),
      
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              
            },
            child: Row(
              spacing : LayoutConstants.spaceL,
              children: [
                Chip(
                  backgroundColor: Colors.purple.shade100,
                  side  : BorderSide.none,
                  label : Icon( Icons.person, color: Colors.purple.shade500, ),
                ),
                Text('Editar Información', style: GlobalFonts.paragraphBodyLargeRegular ,)
              ],
            ),
          ),
      
          Divider( color: Colors.black ),
      
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {

              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {

                  return LogOutSessionDialog(
                    title     : '¿Seguro que quieres salir?',
                    desription: 'Se perderan tus bitacoras que no has enviado.',
                  );
                },
              );

            },
            child: Row(
              spacing : LayoutConstants.spaceL,
              children: [
                Chip(
                  backgroundColor: Colors.blue.shade100,
                  side  : BorderSide.none,
                  label: Icon( Icons.logout_outlined, color: Colors.blue.shade500 )
                ),
                Text('Cerrar sesión', style: GlobalFonts.paragraphBodyLargeRegular ,)
              ],
            ),
          ),
      
        ],
      ),
    );
  }
}