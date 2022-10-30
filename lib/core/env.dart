import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  // TODO(seigi0714): リリースモードかどうかではなくflavorで環境変数出し分け
  static String get fileName => kReleaseMode ? '.prod.env' : '.dev.env';
  static String get protocol => kReleaseMode ? 'https' : 'http';
  static String get lineChannelId =>
      dotenv.env['LINE_CHANNEL_ID'] ?? 'LINE_CHANNEL_ID not found';
  static String get tripAppApiUrl =>
      dotenv.env['TRIPAPP_API_URL'] ?? 'TRIPAPP_API_URL not found';
  static String get tripAppApiPort =>
      dotenv.env['TRIPAPP_API_PORT'] ?? 'TRIPAPP_API_PORT not found';
}
