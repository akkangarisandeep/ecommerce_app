

import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(

    useMaterial3: true,

    fontFamily: 'Roboto',

    scaffoldBackgroundColor:
    const Color(0xFFF5F7FB),

    primaryColor:
    const Color(0xFF6C63FF),

    colorScheme: ColorScheme.light(

      primary:
      const Color(0xFF6C63FF),

      secondary:
      const Color(0xFFFFA726),
    ),

    appBarTheme: const AppBarTheme(

      backgroundColor:
      Color(0xFF6C63FF),

      foregroundColor:
      Colors.white,

      centerTitle: true,

      elevation: 0,
    ),

    elevatedButtonTheme:
    ElevatedButtonThemeData(

      style:
      ElevatedButton.styleFrom(

        backgroundColor:
        const Color(0xFF6C63FF),

        foregroundColor:
        Colors.white,

        elevation: 6,

        shadowColor:
        Colors.black26,

        padding:
        const EdgeInsets.symmetric(

          vertical: 15,
        ),

        shape:
        RoundedRectangleBorder(

          borderRadius:
          BorderRadius.circular(
              16),
        ),
      ),
    ),

    inputDecorationTheme:
    InputDecorationTheme(

      filled: true,

      fillColor: Colors.white,

      contentPadding:
      const EdgeInsets.symmetric(

        horizontal: 20,
        vertical: 16,
      ),

      border:
      OutlineInputBorder(

        borderRadius:
        BorderRadius.circular(
            18),

        borderSide:
        BorderSide.none,
      ),

      enabledBorder:
      OutlineInputBorder(

        borderRadius:
        BorderRadius.circular(
            18),

        borderSide: BorderSide(

          color:
          Colors.grey.shade300,
        ),
      ),

      focusedBorder:
      OutlineInputBorder(

        borderRadius:
        BorderRadius.circular(
            18),

        borderSide:
        const BorderSide(

          color:
          Color(0xFF6C63FF),

          width: 2,
        ),
      ),
    ),

    cardTheme: CardThemeData(

      elevation: 8,

      shadowColor:
      Colors.black12,

      color: Colors.white,

      shape:
      RoundedRectangleBorder(

        borderRadius:
        BorderRadius.circular(
            24),
      ),
    ),
  );
}