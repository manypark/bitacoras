// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {

  CheckboxFormField({
    Key? key,
    required bool initialValue,
    FormFieldValidator<bool>? validator,
    required Widget title,
  }) : super(
    key         : key,
    initialValue: initialValue,
    validator   : validator,
    builder     : (FormFieldState<bool> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children          : [
          CheckboxListTile(
            title     : title,
            value     : state.value,
            onChanged : (bool? value) {
              state.didChange(value);
            },
          ),
        ],
      );
    },
  );

}
