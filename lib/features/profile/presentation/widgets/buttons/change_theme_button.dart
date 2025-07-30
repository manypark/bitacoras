import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/core/utils/constants/layout_constans.dart';
import 'package:bitacoras/features/profile/presentation/cubits/cubits.dart';

class ChangeThemeButton extends StatelessWidget {

  const ChangeThemeButton({ super.key });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      spacing : LayoutConstants.spaceL,
      children: [
        
        Chip(
          backgroundColor: Colors.red.shade100,
          side  : BorderSide.none,
          label: Icon( Icons.theater_comedy, color: Colors.red.shade500 ),
        ),
        
        Text('Tema:', style: GlobalFonts.paragraphBodyLargeRegular ,),
        
        Text( context.watch<ThemeCubit>().state.isDark ? 'Oscuro' : 'Claro', style: GlobalFonts.paragraphBodyLargeSemiBold ),
        
        Spacer(),
        
        Switch.adaptive( 
          value     : context.watch<ThemeCubit>().state.isDark,
          onChanged : (value) => context.read<ThemeCubit>().toggleTheme(),
        ),
        
      ],
    ).fadeIn( animate: true, delay: Duration( milliseconds: 800 ) );
  }
}