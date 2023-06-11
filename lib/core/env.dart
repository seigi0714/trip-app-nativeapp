import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { local, dev, prod }

class Env {
  Env._({
    required this.fileName,
    required this.protocol,
    required this.lineChannelId,
    required this.tripAppApiUrl,
    required this.tripAppApiPort,
  });

  factory Env.byFlavor(Flavor flavor) {
    final isProd = flavor == Flavor.prod;
    final isLocal = flavor == Flavor.local;

    return Env._(
      fileName:
          isProd ? '.prod.env' : (isLocal ? '.dev.local.env' : '.dev.env'),
      protocol: isProd ? 'https' : 'http',
      lineChannelId: _getEnvVar('LINE_CHANNEL_ID'),
      tripAppApiUrl: _getEnvVar('TRIP_APP_API_URL'),
      tripAppApiPort: _getEnvVar('TRIP_APP_API_PORT'),
    );
  }

  final String fileName;
  final String protocol;
  final String lineChannelId;
  final String tripAppApiUrl;
  final String tripAppApiPort;

  static String _getEnvVar(String key) {
    return dotenv.env[key] ?? '$key not found';
  }
}
