import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/shared/widgets/input/inputs.dart';
import 'package:bitacoras/features/auth/presentation/presentation.dart';
import 'package:bitacoras/features/auth/config/constants/constants.dart';

class InputEmail extends StatelessWidget {
  
  const InputEmail({ super.key });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing           : LayoutConstants.spaceS,
      children          : [
        Text(
          email,
          style: GlobalFonts.paragraphBodyMediumBold,
        ),
        InputGlobal(
          initialValue  : 'manu@live.com',
          textInputType : TextInputType.emailAddress,
          hintText      : hintTextEmail,
          onChanged     : (value) {
            context.read<FormLoginBloc>().onChangeEmail(value);
          },
          validator: ( String? value ) {

            final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

            if (value == null || value.isEmpty) {
              return 'El campo es requerido';
            }
            
            if (!emailRegex.hasMatch(value)) {
              return 'Ingresa un email valido';
            }

            return null;
          },
        ),
      ],
    );
  }
}
