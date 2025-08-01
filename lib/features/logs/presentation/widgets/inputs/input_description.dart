import 'package:bitacoras/features/logs/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputDescriptionTaskLogs extends StatelessWidget {

  const InputDescriptionTaskLogs({ super.key });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines  : 5,
      decoration: InputDecoration(
        hintText      : 'Escribe algo',
        contentPadding: EdgeInsets.only( left: 20, bottom: 12, right: 40, top: 12 ),
        hintStyle     : GlobalFonts.paragraphBodyMediumRegular.copyWith(color: Colors.grey.shade600),
        fillColor     : Colors.white,
        filled        : true,
        border        : OutlineInputBorder(
          borderSide  : BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onChanged: (value) {
        context.read<TaksLogFormBloc>().writeDescriptionLog( value );
      },
    ).fadeIn( delay: Duration( milliseconds: 200 ) );
  }
}