import 'package:flutter/foundation.dart';
import 'package:roggle/roggle.dart';

final logger = DebugLogger();

class DebugLogger extends Roggle {
  DebugLogger()
      : super(
          printer: SinglePrettyPrinter(
            loggerName: ' [APP]',
            // warning 以上のときはスタックトレースを出力する
            stackTraceLevel: Level.warning,
            // ログが長くなるので非表示
            printCaller: false,
          ),
        );

  @override
  void i(Object? message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      super.i(message, error, stackTrace);
    }
  }

  @override
  void e(Object? message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      super.e(message, error, stackTrace);
    }
  }
}
