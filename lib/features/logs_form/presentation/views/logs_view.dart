import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/constants/constans.dart';
import 'package:bitacoras/features/logs_form/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/logs_form/presentation/widgets/widgets.dart';

class LogsView extends StatelessWidget {

  const LogsView({ super.key });

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Form(
                child: Padding(
                  padding : const EdgeInsets.symmetric(horizontal: LayoutConstants.spaceL),
                  child   : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children          : [

                      const SizedBox(height: LayoutConstants.spaceM),

                      const SelectOptionConcept(),

                      const SizedBox(height: LayoutConstants.spaceXL),

                      const InputDescriptionTaskLogs(),

                      const SizedBox(height: LayoutConstants.spaceXL),

                      if( context.watch<TaksLogFormBloc>().state.pathImage.isEmpty )
                      const ContainerSelectImage(),

                      if( context.watch<TaksLogFormBloc>().state.pathImage.isNotEmpty )
                      SelectedImage(height: height),

                      Spacer(),

                      SaveFormButton(height: height),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}