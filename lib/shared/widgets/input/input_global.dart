import 'package:flutter/material.dart';
import 'package:bitacoras/core/configs/configs.dart';

class InputGlobal extends StatelessWidget {

  final TextEditingController? controller;
  final bool obscureText;
  final String hintText;
  final TextInputType textInputType;

  const InputGlobal({
    super.key,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText  : hintText,
        hintStyle : GlobalFonts.paragraphBodyMediumRegular.copyWith( color: Colors.grey ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide( color: Colors.grey )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide( color: Colors.red.shade300 )
        )
      ),
    );
  }
}