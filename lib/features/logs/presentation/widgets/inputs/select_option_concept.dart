import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/logs/presentation/blocs/blocs.dart';

class SelectOptionConcept extends StatelessWidget {

  const SelectOptionConcept({ super.key });

  @override
  Widget build(BuildContext context) {
    
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField<String>(
          style: GlobalFonts.paragraphBodyMediumRegular.copyWith(color: Colors.grey.shade600),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 22),
            hintText: 'Selecciona una opción',
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon  : Icon(Icons.keyboard_arrow_down_rounded),
          items : ['Salida de patio', 'Salida de gasolinera', 'Caseta', 'Llegada a descargar'].map((option) => DropdownMenuItem(
              value: option,
              child: Text(option, style: GlobalFonts.paragraphBodyMediumRegular),
            )
          ).toList(),
          onChanged: (value) {
            context.read<TaksLogFormBloc>().selectOptionTaskLog( value ?? '' );
          },
          validator: (value) {

            if (value == null) {
              return 'Por favor selecciona una opción';
            }
            return null;
          },
          elevation: 2,
          borderRadius: BorderRadius.circular(12),
          enableFeedback: true,
        ),
      ),
    ).fadeIn( delay: Duration( milliseconds: 100 ) );
  }
}