
import 'package:bitacoras/core/configs/configs.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function()? onPress;

  const CustomButton({
    super.key, 
    this.onPress,
    required this.text, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          if(onPress != null)
          BoxShadow(
            blurRadius: 35,
            spreadRadius: 0,
            color: Colors.black45,
            offset: Offset(0, 12),
          )
        ]
      ),
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed : onPress,
        style     : ButtonStyle( backgroundColor: WidgetStatePropertyAll(onPress == null ? Colors.grey.shade600 : Colors.black) ),
        child     : Text(
          text,
          style: GlobalFonts.paragraphBodyLargeBold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}