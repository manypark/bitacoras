// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class RadioFormField<T> extends FormField<T> {

  RadioFormField({
    Key? key,
    required List<T> options,
    FormFieldValidator<T>? validator,
    required Widget Function(T) labelBuilder,
  }) : super(
    key: key,
    validator: validator,
    builder: (FormFieldState<T> state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children          : [
          ...options.map((option) => RadioListTile<T>(
            title: labelBuilder(option),
            value: option,
            groupValue: state.value,
            onChanged: (T? value) {
              state.didChange(value);
            },
          )),
        ],
      );
    },
  );
}
