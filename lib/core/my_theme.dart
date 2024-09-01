import 'package:flutter/material.dart';

class Mytheme {
  static final Mytheme instance = Mytheme();
  ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    buttonTheme: ButtonThemeData(colorScheme: ColorScheme.light(background: Colors.green)
    ),
   textTheme:TextTheme(
    displayLarge: TextStyle(
      fontSize: 22,
      color: Colors.green,
      
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: const Color.fromARGB(255, 249, 247, 247),
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    ),

   ), 

  );


   ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    buttonTheme: ButtonThemeData(colorScheme: ColorScheme.dark(background: const Color.fromARGB(255, 143, 237, 146))
    ),
   textTheme:TextTheme(
    displayLarge: TextStyle(
      fontSize: 22,
      color: Colors.white,
      
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    labelLarge: TextStyle(
      fontSize: 16,
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    ),

   ), 

  );
}
