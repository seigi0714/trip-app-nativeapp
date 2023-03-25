import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';

part 'theme.g.dart';

@riverpod
ThemeData themeData(
  ThemeDataRef ref,
  BuildContext context, {
  required bool isDark,
}) {
  return ThemeData(
    brightness: isDark ? Brightness.dark : Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: const Color.fromRGBO(29, 233, 182, 1),
    textTheme: GoogleFonts.zenMaruGothicTextTheme(
      context.textTheme,
    ).apply(
      bodyColor: isDark ? Colors.white : Colors.black,
      displayColor: isDark ? Colors.white : Colors.black,
    ),
  );
}
