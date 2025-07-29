import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/core/utils/constants/layout_constans.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/tasks/presentation/presentation.dart';

class LogOutSessionDialog extends StatelessWidget {

  final String title;
  final String desription;

  const LogOutSessionDialog({
    super.key, 
    required this.title, 
    required this.desription,
  });

  @override
  Widget build(BuildContext context) {

    return Dialog(
      backgroundColor : Colors.white,
      shape           : RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) ),
      child: SizedBox(
        child : Padding(
          padding: EdgeInsets.all( LayoutConstants.spaceL ),
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            mainAxisSize      : MainAxisSize.min,
            spacing           : LayoutConstants.spaceXL,
            children          : [

              Column(
                spacing : LayoutConstants.spaceXL,
                children: [
                  Text( title.toUpperCase(), style: GlobalFonts.paragraphBodyLargeRegular, textAlign: TextAlign.center, ),
                  Text( desription, style: GlobalFonts.paragraphBodyMediumRegular, textAlign: TextAlign.center, ),
                ],
              ),

              Row(
                children: [

                  TextButton(
                    onPressed: () {
                      context.read<LoginBloc>().resetUser();
                      context.read<TasksBloc>().resetTasks();
                      context.read<RangeDatesBloc>().onUpdateStartAdnEndDate( DateTime.now(), DateTime.now() );
                      context.go('/auth');
                    },
                    child: Text('Salir', style: GlobalFonts.paragraphBodyLargeRegular.copyWith(color: Colors.blueAccent ),),
                  ),

                  Spacer(),

                  TextButton(
                    onPressed : () => context.pop(), 
                    child     : Text('Cancelar', style: GlobalFonts.paragraphBodyLargeRegular.copyWith(color: Colors.blueAccent ),),
                  ),

                ],
              )
          
            ],
          ),
        ),
      ),
    );
  }

}
