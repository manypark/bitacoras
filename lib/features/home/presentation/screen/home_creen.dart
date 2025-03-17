import 'package:bitacoras/core/utils/utils.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const path = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: LayoutConstants.spaceM,
          children: [

            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Text('Home screen: ${state.userLogin?.email ?? ''}');
              },
            ),
            
            ElevatedButton(
              onPressed: () async {

                await context.read<LoginBloc>().resetUser();

                // ignore: use_build_context_synchronously
                context.go('/auth');
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
