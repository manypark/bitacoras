import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';

class InputDescriptionTaskLogs extends StatelessWidget {

  const InputDescriptionTaskLogs({ super.key });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines  : 5,
      decoration: InputDecoration(
        hintText      : 'Escribe algo',
        contentPadding: EdgeInsets.only( left: 20, bottom: 12, right: 40, top: 12 ),
        hintStyle     : GlobalFonts.paragraphBodyMediumRegular.copyWith(color: Colors.grey.shade600),
        fillColor     : Colors.white,
        filled        : true,
        border        : OutlineInputBorder(
          borderSide  : BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onFieldSubmitted: (value) {},
    );
  }
}