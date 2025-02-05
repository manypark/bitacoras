import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';

class LogoLogin extends StatelessWidget {

  const LogoLogin({ super.key });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height    : 120,
        width     : 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.grey.shade300
        ),
        child: Center(child: Text('B', style: GlobalFonts.paragraphBodyLargeBold.copyWith(fontSize: 54),)),
      ),
    );
  }
}

