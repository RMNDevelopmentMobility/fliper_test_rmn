import 'package:fliper_test_rmn/app/shared/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get themeData {
    final primaryColor = AppColors.mainBlue;
    final primaryColorLight = AppColors.textGray;
    final backgroundColor = AppColors.screenBackground;

    final dividerTheme = DividerThemeData(
      color: primaryColorLight,
      thickness: 0.5,
      space: 0.0,
    );

    final floatingActionButtonTheme =
        FloatingActionButtonThemeData(backgroundColor: primaryColor);

    final cardTheme = CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 3,
    );

    return ThemeData(
      fontFamily: 'ProximaNova',
      primaryColor: primaryColor,
      primaryColorLight: primaryColorLight,
      scaffoldBackgroundColor: backgroundColor,
      backgroundColor: backgroundColor,
      dividerTheme: dividerTheme,
      floatingActionButtonTheme: floatingActionButtonTheme,
      accentColor: primaryColor,
      disabledColor: primaryColorLight,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      cardTheme: cardTheme,
    );
  }
}
