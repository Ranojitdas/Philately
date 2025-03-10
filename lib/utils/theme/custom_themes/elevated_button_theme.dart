import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  ///--- Light Theme

 static final lightElevatedButtonTheme = ElevatedButtonThemeData(
   style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
     backgroundColor: Colors.deepOrange,
     disabledForegroundColor: Colors.grey,
     disabledBackgroundColor: Colors.grey,
     side: const BorderSide(color: Colors.deepOrangeAccent),
     padding: const EdgeInsets.symmetric(vertical: 18),
     textStyle: const TextStyle(fontSize:16, color: Colors.white, fontWeight: FontWeight.w600),
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
   ),
 );

  ///-- Dark theme
static final darkElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
  elevation: 0,
  foregroundColor: Colors.white,
  backgroundColor: Colors.deepOrange,
  disabledForegroundColor: Colors.grey,
  disabledBackgroundColor: Colors.grey,
  side: const BorderSide(color: Colors.deepOrangeAccent),
  padding: const EdgeInsets.symmetric(vertical: 18),
  textStyle: const TextStyle(fontSize:16, color: Colors.white, fontWeight: FontWeight.w600),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
)
);
























}