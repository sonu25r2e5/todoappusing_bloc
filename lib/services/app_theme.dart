import 'package:flutter/material.dart';

//create an enum for app sync
enum AppTheme { lightTheme, darkTheme }

//creating a theme
class AppThemes {
  static final appThemeData = {
    //properties of theme : darkTheme
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      dividerColor: Colors.black54,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(Colors.white),
        ),
      ),

      textTheme: TextTheme(titleLarge: TextStyle(color: Colors.black)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
    ),

    // light properties.
    AppTheme.lightTheme: ThemeData(
      primaryColor: Colors.white,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xFFE5E5E5),
      dividerColor: Color(0xff757575),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          // Material state property changes to WidgetStateProperty.
          foregroundColor: WidgetStateProperty.all(Colors.black),
        ),
      ),
      textTheme: TextTheme(titleMedium: TextStyle(color: Colors.black)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
      ),
    ),
  };
}
