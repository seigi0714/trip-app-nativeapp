import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get fileName => kReleaseMode ? '.prod.env' : '.dev.env';
  static String get lineChannelId =>
      dotenv.env['LINE_CHANNEL_ID'] ?? 'LINE_CHANNEL_ID not found';
  static String get inet => dotenv.env['INET'] ?? 'INET not found';
  static String get port => dotenv.env['PORT'] ?? 'PORT not found';
}
