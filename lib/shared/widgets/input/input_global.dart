import 'package:flutter/material.dart';
import 'package:bitacoras/core/configs/configs.dart';

class InputGlobal extends StatelessWidget {

  final TextEditingController? controller;
  final bool obscureText;
  final String hintText;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const InputGlobal({
    super.key,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    this.onChanged,
    this.validator,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      textInputAction : TextInputAction.next,
      keyboardType    : textInputType,
      obscureText     : obscureText,
      controller      : controller,
      onChanged       : onChanged,
      validator       : validator,
      decoration: InputDecoration(
        hintText  : hintText,
        hintStyle : GlobalFonts.paragraphBodyMediumRegular.copyWith( color: Colors.grey ),
        border    : OutlineInputBorder(
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