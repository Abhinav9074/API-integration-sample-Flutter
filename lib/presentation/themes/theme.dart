import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      bodyLarge: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      bodyMedium: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    ));

class MyTextStyle {

  static const TextStyle commonText = TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 15,
      fontWeight: FontWeight.w900,
      fontFamily: 'Montserrat-Medium',
      letterSpacing: 0.9);

  static const TextStyle buttonText = TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 20,
      fontWeight: FontWeight.w100,
      fontFamily: 'Montserrat-Medium',
      letterSpacing: 0.9);
      
  static const TextStyle buttonTextBlack = TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 20,
      fontWeight: FontWeight.w100,
      fontFamily: 'Montserrat-Medium',
      letterSpacing: 0.9);

  static const TextStyle errorText = TextStyle(
      color: Color.fromARGB(255, 255, 5, 5),
      fontSize: 15,
      fontWeight: FontWeight.w100,
      fontFamily: 'Montserrat-Medium',
      letterSpacing: 0.9);

}
