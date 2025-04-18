import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';

class SaveFormButton extends StatelessWidget {
  
  const SaveFormButton({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : EdgeInsets.only( bottom: height * 0.06 ),
      child   : SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Guardar Bitacora',
            style: GlobalFonts.paragraphBodyMediumRegular.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}