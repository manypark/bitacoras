import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class StackLoader extends StatelessWidget {

  final bool animate;
  final Widget child;

  const StackLoader({
    super.key, 
    this.animate = false,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        child,

        if(animate) ...[

          Positioned.fill(
            child: Container(
              color: Colors.white.withValues(alpha: 0.8),
            )
          ),

          Center(
            child: Lottie.asset('assets/lotties/loading.json'),
          )

        ]
      ],
    );
  }
}
