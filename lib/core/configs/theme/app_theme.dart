import 'package:flutter/material.dart';

class AppTheme {

  ThemeData getThemeLight() => ThemeData(
    colorSchemeSeed : Colors.black26,
    brightness      : Brightness.light,
    scaffoldBackgroundColor: Colors.grey.shade200,
    appBarTheme     : AppBarTheme(
      backgroundColor: Colors.grey.shade200
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black,
      hintStyle: const TextStyle( color: Colors.black )
    ),
    textTheme       : const TextTheme(
      bodyMedium  : TextStyle( color : Colors.black38 ),
      titleLarge  : TextStyle( color : Colors.black38, fontSize: 26 ),
      titleMedium : TextStyle( color : Colors.black38, fontSize: 22 ),
      titleSmall  : TextStyle( color : Colors.black38, fontSize: 18),
    ),
    canvasColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blueAccent
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith((states) {
          
          if ( states.contains(WidgetState.disabled) ) {
            return Colors.blueGrey.shade300;
          }

          return Colors.blueAccent;
        },),
      )
    ),
  );

  ThemeData getThemeDark() => ThemeData(
    colorSchemeSeed : Colors.purple.shade900,
    brightness      : Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade800,
    appBarTheme     : AppBarTheme(
      backgroundColor: Colors.grey.shade800
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle( color: Colors.white ),
    ),
    textTheme       : const TextTheme(
      bodyMedium: TextStyle( color : Colors.white ),
      titleLarge  : TextStyle( color : Colors.white, fontSize: 26 ),
      titleMedium : TextStyle( color : Colors.white, fontSize: 22 ),
      titleSmall  : TextStyle( color : Colors.white, fontSize: 18 ),
    ),
    canvasColor: Colors.red,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blueAccent
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith((states) {
          
          if ( states.contains(WidgetState.disabled) ) {
            return Colors.blueGrey.shade300;
          }

          return Colors.blueAccent;
        },),
      )
    ),
  );

} 