import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/shared/widgets/input/inputs.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/config/constants/constants.dart';

class InputPassword extends StatelessWidget {
  
  const InputPassword({ super.key });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing           : LayoutConstants.spaceS,
      children          : [
        Text(
          password,
          style: GlobalFonts.paragraphBodyMediumBold,
        ),
        InputGlobal(
          initialValue: 'asd123A',
          hintText    : hintTextPassword,
          obscureText : true,
          onChanged   : (value) {
            context.read<FormLoginBloc>().onChangePassword(value);
          },
          validator: ( String? value ) {
            
            if (value == null || value.isEmpty) {
              return 'El campo es requerido';
            }

            return null;
          },
        ),
      ],
    );
  }
}
