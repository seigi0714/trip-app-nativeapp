import 'package:roggle/roggle.dart';

final logger = Roggle(
  printer: SinglePrettyPrinter(
    loggerName: ' [APP]',
    // warning 以上のときはスタックトレースを出力する
    stackTraceLevel: Level.warning,
    // ログが長くなるので非表示
    printCaller: false,
  ),
);
