import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// テーマ
  ThemeData get theme => Theme.of(this);

  /// テキストのテーマ
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// displayLarge のスタイル
  TextStyle? get displayLarge => textTheme.displayLarge;

  /// displayMedium のスタイル
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// displaySmall のスタイル
  TextStyle? get displaySmall => textTheme.displaySmall;

  /// headlineLarge のスタイル
  TextStyle? get headlineLarge => textTheme.headlineLarge;

  /// headlineMedium のスタイル
  TextStyle? get headlineMedium => textTheme.headlineMedium;

  /// headlineSmall のスタイル
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /// titleLarge のスタイル
  TextStyle? get titleLarge => textTheme.titleLarge;

  /// titleMedium のスタイル
  TextStyle? get titleMedium => textTheme.titleMedium;

  /// titleSmall のスタイル
  TextStyle? get titleSmall => textTheme.titleSmall;

  /// bodyLarge のスタイル
  TextStyle? get bodyLarge => textTheme.bodyLarge;

  /// bodyMedium のスタイル
  TextStyle? get bodyMedium => textTheme.bodyMedium;

  /// bodySmall のスタイル
  TextStyle? get bodySmall => textTheme.bodySmall;

  /// labelLarge のスタイル
  TextStyle? get labelLarge => textTheme.labelLarge;

  /// labelMedium のスタイル
  TextStyle? get labelMedium => textTheme.labelMedium;

  /// labelSmall のスタイル
  TextStyle? get labelSmall => textTheme.labelSmall;

  /// ディスプレイサイズ
  Size get displaySize => MediaQuery.of(this).size;

  /// iOS かどうか
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;

  /// Android かどうか
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;
}
