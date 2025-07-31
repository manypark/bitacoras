import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/logs/presentation/blocs/blocs.dart';

class SaveFormButton extends StatelessWidget {
  
  final double height;
  
  const SaveFormButton({ super.key, required this.height, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : EdgeInsets.only( bottom: height * 0.06 ),
      child   : SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed : () => context.read<TaksLogFormBloc>().submitTaksLog(),
          child     : Text(
            'Guardar Bitacora',
            style: GlobalFonts.paragraphBodyMediumRegular.copyWith(color: Colors.white),
          ),
        ),
      ),
    ).fadeIn( delay: Duration( milliseconds: 400 ) );
  }
}