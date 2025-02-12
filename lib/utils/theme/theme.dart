import 'package:e_commerce_user/utils/theme/widgets_theme/appbar_theme.dart';
import 'package:e_commerce_user/utils/theme/widgets_theme/chip_theme.dart';
import 'package:e_commerce_user/utils/theme/widgets_theme/elevated_button_theme.dart';
import 'package:e_commerce_user/utils/theme/widgets_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      textTheme: TTextTheme.lightTextTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      chipTheme: AChipTheme.lightChipTheme,
      elevatedButtonTheme: AElevatedButtonTheme.lightElevatedButtonTheme,
      fontFamily: GoogleFonts.poppins().fontFamily);

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      brightness: Brightness.dark,
      textTheme: TTextTheme.darkTextTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      chipTheme: AChipTheme.darkChipTheme,
      elevatedButtonTheme: AElevatedButtonTheme.darkElevatedButtonTheme,
      fontFamily: GoogleFonts.poppins().fontFamily);
}
