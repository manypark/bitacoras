
import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/core/utils/constants/constans.dart';
import 'package:flutter/material.dart';

class LogsView extends StatelessWidget {

  const LogsView({super.key});

  @override
  Widget build(BuildContext context) {

  final height = MediaQuery.of(context).size.height;

  return LayoutBuilder(
    builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: LayoutConstants.spaceL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children          : [

                    const SizedBox(height: LayoutConstants.spaceM),

                    
                    DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButtonFormField<String>(
                          style: TextStyle(fontSize: 16),
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
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          items: ['Salida de patio', 'Salida de gasolinera', 'Caseta', 'Llegada a descargar']
                              .map((option) => DropdownMenuItem(
                                    value: option,
                                    child: Text(option, style: GlobalFonts.paragraphBodyMediumRegular),
                                  ))
                              .toList(),
                          onChanged: (value) {},
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
                    ),

                    const SizedBox(height: LayoutConstants.spaceXL),

                    
                    TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Escribe algo',
                        hintStyle: GlobalFonts.paragraphBodyMediumRegular.copyWith(color: Colors.grey.shade600),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onFieldSubmitted: (value) {},
                    ),

                    Spacer(),

                    Padding(
                      padding : EdgeInsets.only( bottom: height * 0.2 ),
                      child   : SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Guardar',
                            style: GlobalFonts.paragraphBodyMediumRegular.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

}