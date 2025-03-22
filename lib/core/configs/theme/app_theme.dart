import 'package:flutter/material.dart';

class AppTheme {

  ThemeData getThemeLight() => ThemeData(
    useMaterial3    : true,
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
    canvasColor: Colors.white
  );

  ThemeData getThemeDark() => ThemeData(
    useMaterial3    : true,
    colorSchemeSeed : Colors.purple.shade900,
    brightness      : Brightness.dark,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle( color: Colors.white ),
    ),
    textTheme       : const TextTheme(
      bodyMedium: TextStyle( color : Colors.white ),
      titleLarge  : TextStyle( color : Colors.white, fontSize: 26 ),
      titleMedium : TextStyle( color : Colors.white, fontSize: 22 ),
      titleSmall  : TextStyle( color : Colors.white, fontSize: 18 ),
    ),
    canvasColor: Colors.red
  );

} 