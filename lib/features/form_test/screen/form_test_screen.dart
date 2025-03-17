import 'package:flutter/material.dart';
import 'package:bitacoras/features/form_test/widgets/widgets.dart';

class FormTestScreen extends StatefulWidget {

  static String path = '/form-test-screen';

  const FormTestScreen({super.key});

  @override
  MyFormPageState createState() => MyFormPageState();
}

class MyFormPageState extends State<FormTestScreen> {

  final _formKey = GlobalKey<FormState>();

  // Variables para almacenar los valores del formulario
  String textValue = '';
  List<bool> toggleValues = [false, false, false];
  int? radioValue;
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulario Ejemplo")),
      body  : Form(
        key   : _formKey,
        child : ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Campo de texto
            TextFormField(
              decoration: InputDecoration(labelText: 'Campo de Texto'),
              validator : (value) {
                if (value == null || value.isEmpty) {
                  return '';
                }
                return null;
              },
              onSaved: (value) {
                textValue = value ?? '';
              },
            ),
            SizedBox(height: 20),
            // ToggleButtons
            Text("ToggleButtons:"),
            ToggleButtonsFormField(
              initialValue: toggleValues,
              validator   : (value) {
                if (value == null || !value.contains(true)) {
                  return 'Seleccione al menos una opción';
                }
                return null;
              },
              children: [
                ...List.generate(3, (index) => Text('${index + 1}'),),
              ],
            ),
            SizedBox(height: 20),

            // RadioListTile
            Text("RadioListTile:"),
            RadioFormField<int>(
              options     : [1, 2, 3],
              validator   : (value) {
                if (value == null) {
                  return 'Seleccione una opción';
                }
                return null;
              },
              labelBuilder: (option) => Text("Opción $option"),
            ),
            SizedBox(height: 20),

            // CheckboxListTile
            Text("CheckboxListTile:"),
            CheckboxFormField(
              initialValue: checkboxValue,
              validator   : (value) {
                if (value == null || !value) {
                  return 'Debe aceptar la opción';
                }
                return null;
              },
              title: Text("Acepto términos y condiciones"),
            ),
            SizedBox(height: 20),

            // Botón de envío
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Aquí puedes manejar la lógica una vez validado el formulario
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Formulario válido')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Revise los errores en el formulario')),
                  );
                }
              },
              child: Text("Enviar Formulario"),
            ),
          ],
        ),
      ),
    );
  }
}
