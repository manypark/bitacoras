import 'package:flutter/material.dart';

import 'package:bitacoras/core/utils/constants/constans.dart';
import 'package:bitacoras/features/logs/presentation/widgets/widgets.dart';

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

                      const ContainerSelectImage(),

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