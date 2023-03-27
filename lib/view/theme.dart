import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';

part 'theme.g.dart';

@riverpod
ThemeData lightThemeData(
  LightThemeDataRef ref,
  BuildContext context,
) {
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: const Color.fromRGBO(29, 233, 182, 1),
    textTheme: GoogleFonts.zenMaruGothicTextTheme(
      context.textTheme,
    ).apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
  );
}

@riverpod
ThemeData darkThemeData(
  DarkThemeDataRef ref,
  BuildContext context,
) {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: const Color.fromRGBO(29, 233, 182, 1),
    textTheme: GoogleFonts.zenMaruGothicTextTheme(
      context.textTheme,
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );
}
