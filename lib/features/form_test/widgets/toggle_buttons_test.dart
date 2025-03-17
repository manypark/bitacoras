import 'package:flutter/material.dart';

class ToggleButtonsFormField extends FormField<List<bool>> {

  // ignore: use_super_parameters
  ToggleButtonsFormField({
    Key? key,
    required List<bool> initialValue,
    FormFieldValidator<List<bool>>? validator,
    required List<Widget> children,
  }) : super(
    key         : key,
    initialValue: initialValue,
    validator   : validator,
    builder     : (FormFieldState<List<bool>> state) =>
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [

        ToggleButtons(
          isSelected: state.value!,
          onPressed : (int index) {
            List<bool> currentValue = List.from(state.value!);
            currentValue[index] = !currentValue[index];
            state.didChange(currentValue);
          },
          children  : children,
        ),

      ],
    ),
  );
}
