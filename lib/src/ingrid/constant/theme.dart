import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class ConstTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: ConstColor.primary,
    scaffoldBackgroundColor: ConstColor.lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      width: 264.0,
    ),
    cardColor: Colors.white,
    dividerColor: ConstColor.lightGray,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: ConstColor.primary,
    scaffoldBackgroundColor: ConstColor.darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ConstColor.darkAppBar,
      surfaceTintColor: ConstColor.darkAppBar,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: ConstColor.darkAppBar,
      surfaceTintColor: ConstColor.darkAppBar,
      shape: ContinuousRectangleBorder(),
      width: 264.0,
    ),
    cardColor: ConstColor.darkAppBar,
    dividerColor: ConstColor.lightGray,
  );

  static TextStyle title(BuildContext context) => TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: context.isDarkMode ? Colors.white : ConstColor.lightTextColor,
      );

  static TextStyle text(BuildContext context) => TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: context.isDarkMode ? Colors.white : ConstColor.lightTextColor,
      );

  static TextStyle hintText = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: ConstColor.hintColor,
  );

  static TextStyle heading = const TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );
}
