import 'package:flutter/material.dart';

import 'package:bitacoras/shared/progres/progres.dart';

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
            child: CircularProgress( color: Colors.black ),
          )

        ]
      ],
    );
  }
}
