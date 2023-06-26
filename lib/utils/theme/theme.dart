import 'package:design/utils/app_colors.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  // Customize the dark theme properties
  appBarTheme: const AppBarTheme(color: Colors.black),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Color.fromARGB(255, 137, 131, 131),
    unselectedItemColor: Color.fromARGB(255, 71, 69, 69),
    selectedIconTheme: IconThemeData(
      color: Color.fromARGB(255, 137, 131, 131),
    ),
    unselectedIconTheme: IconThemeData(
      color: Color.fromARGB(255, 71, 69, 69),
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
);

final lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(color: Colors.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: AppColors.textfields.withOpacity(0.3),
    unselectedItemColor: Colors.white,
    selectedIconTheme: const IconThemeData(
      color: AppColors.darkgreen,
    ),
    unselectedIconTheme: const IconThemeData(
      color: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  // Customize the light theme properties
);
