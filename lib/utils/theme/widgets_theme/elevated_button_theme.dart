import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class AElevatedButtonTheme {
  AElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor:
         Colors.black,
        foregroundColor:
         Colors.white,
        textStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10))
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor:
        Colors.white ,
        foregroundColor:
        AColors.dark ,
        textStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10))
    ),
  );
}
