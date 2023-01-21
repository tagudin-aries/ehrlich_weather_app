import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static const MaterialColor mcgpalette0 =
      MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFF3FBFE),
    100: Color(0xFFE0F5FD),
    200: Color(0xFFCCEEFC),
    300: Color(0xFFB8E7FB),
    400: Color(0xFFA8E1FA),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFF91D8F8),
    700: Color(0xFF86D3F7),
    800: Color(0xFF7CCEF6),
    900: Color(0xFF6BC5F5),
  });
  static const int _mcgpalette0PrimaryValue = 0xFF99DCF9;

  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(_mcgpalette0PrimaryValue),
    primarySwatch: mcgpalette0,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    // scaffoldBackgroundColor: Color(_mcgpalette0PrimaryValue),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );

  // static ThemeData darkTheme = ThemeData(
  //   primaryColor: Color(_mcgpalette0PrimaryValue),
  //   primarySwatch: mcgpalette0,
  //   brightness: Brightness.dark,
  //   textTheme: TTextTheme.darkTextTheme,
  //   appBarTheme: AppBarTheme(),
  //   floatingActionButtonTheme: FloatingActionButtonThemeData(),
  //   elevatedButtonTheme:
  //       ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  // );
}

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline2: GoogleFonts.montserrat(color: Colors.black87, fontSize: 20),
    headline3: GoogleFonts.montserrat(
        color: Colors.black87, fontSize: 24, fontWeight: FontWeight.bold),
    headline4: GoogleFonts.montserrat(
        color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w500),
    subtitle2: GoogleFonts.poppins(color: Colors.deepPurple, fontSize: 22),
    subtitle1: GoogleFonts.poppins(color: Colors.deepPurple, fontSize: 20),
    bodyText1: GoogleFonts.poppins(
        color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500),
  );
  static TextTheme darkTextTheme = TextTheme(
    headline2: GoogleFonts.montserrat(color: Colors.white70),
    subtitle2: GoogleFonts.poppins(color: Colors.white60, fontSize: 24),
  );
}
