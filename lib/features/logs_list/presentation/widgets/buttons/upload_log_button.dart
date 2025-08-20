import 'package:flutter/material.dart';

import 'package:bitacoras/core/utils/constants/constans.dart';

class UploadLogButtonWidget extends StatelessWidget {

  const UploadLogButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){},
      icon: Icon( Icons.cloud_upload_outlined, color: Colors.white ),
      style     : ButtonStyle(
        backgroundColor : WidgetStatePropertyAll( Colors.blueAccent ),
        shape           : WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(LayoutConstants.spaceM),
          )
        ),
      )
    );
  }
}