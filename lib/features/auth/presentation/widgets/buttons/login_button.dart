// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/auth/config/constants/constants.dart';

class ButtonLogin extends StatelessWidget {

  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 35,
          spreadRadius: 0,
          color: Colors.black45,
          offset: Offset(0, 12),
        )
      ]),
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {

          final response = await context.read<FormLoginBloc>().onSubmit(context);

          if (response) context.go('/home');
        },
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black)),
        child: Text(
          buttonLogin,
          style: GlobalFonts.paragraphBodyLargeBold
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
