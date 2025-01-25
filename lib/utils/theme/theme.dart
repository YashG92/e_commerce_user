import 'package:e_commerce_user/utils/theme/widgets_theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme{

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,

  );
}