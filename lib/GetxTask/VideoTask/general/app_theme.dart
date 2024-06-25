import 'package:flutter/material.dart';

class AppThemes {
  static final Color lightFocusColor = Colors.black.withOpacity(0.2);
  static final Color darkFocusColor = Colors.white.withOpacity(0.2);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        color: colorScheme.primary,
        elevation: 0,
      ),
      brightness: colorScheme.brightness,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      //highlightColor:  colorScheme.
      focusColor: focusColor,
    );
  }

  static ColorScheme darkColorScheme = ColorScheme(
    primary: Colors.lightBlue,
    onPrimaryContainer: Colors.lightBlue.shade900,
    secondary: Colors.yellow,
    onSecondaryContainer: Colors.yellow.shade900,
    background: const Color(0xff141A31),
    surface: const Color(0xff1E2746),
    onBackground: const Color(0x0DFFFFFF),
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xff6300EE),
    onPrimaryContainer: Color(0xFF640AFF),
    secondary: Color(0xff03DAC5),
    onSecondaryContainer: Color(0xFF0AE1C5),
    background: Color(0xffE6EBEB),
    surface: Color(0xffFAFBFB),
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Color(0xff322942),
    onSurface: Color(0xff241E30),
    brightness: Brightness.light,
  );
}
