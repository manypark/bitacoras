// ignore_for_file: use_build_context_synchronously
import 'package:bitacoras/features/logs/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/shared/shared.dart';
import 'package:bitacoras/features/menu/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/config/constants/constants.dart';

class ButtonLogin extends StatelessWidget {

  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomButton(
      text    : buttonLogin,
      onPress : () async {

        final isValid = context.read<FormLoginBloc>().state.globalKeyFormLogin.currentState!.validate();

        if(!isValid) return;

        final response = await context.read<FormLoginBloc>().onSubmit(context);

        if( !response ) {

          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {

              final errCode = context.read<LoginBloc>().state.errorMessage?.error_code ?? 'err';
              final msg     = context.read<LoginBloc>().state.errorMessage?.msg ?? 'msg';

              return CustomDialog(
                title     : errCode,
                desription: msg,
                pathImage : 'assets/illustration/payment-error.svg',
              );
            },
          );

          return;
        }

        context.read<MenuBloc>().loadMenuList();
        context.read<ConceptsBloc>().loadConceptList();
        if (response) context.go('/home');
      },
    );
  }
}
