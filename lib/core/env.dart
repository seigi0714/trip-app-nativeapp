import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'env.g.dart';

enum Flavor {
  local(fileName: '.env.local', protocol: 'http'),
  prism(fileName: '.env.prism', protocol: 'http'),
  prod(fileName: '.env.prod', protocol: 'https');

  const Flavor({required this.fileName, required this.protocol});

  final String fileName;
  final String protocol;

  static Flavor fromString(String flavorName) {
    switch (flavorName) {
      case 'local':
        return Flavor.local;
      case 'prism':
        return Flavor.prism;
      case 'prod':
        return Flavor.prod;
      default:
        throw Exception('Invalid flavor name: $flavorName');
    }
  }
}

@Riverpod(keepAlive: true)
Env env(EnvRef ref) {
  return throw UnimplementedError();
}

class Env {
  Env._({
    required this.protocol,
    required this.lineChannelId,
    required this.tripAppApiUrl,
    required this.tripAppApiPort,
  });

  static Future<Env> byFlavor(Flavor flavor) async {
    await dotenv.load(fileName: flavor.fileName);
    return Env._(
      protocol: flavor.protocol,
      lineChannelId: _getEnvVar('LINE_CHANNEL_ID'),
      tripAppApiUrl: _getEnvVar('TRIPAPP_API_URL'),
      tripAppApiPort: _getEnvVar('TRIPAPP_API_PORT'),
    );
  }

  final String protocol;
  final String lineChannelId;
  final String tripAppApiUrl;
  final String tripAppApiPort;

  static String _getEnvVar(String key) {
    final value = dotenv.env[key];
    if (value == null) {
      throw Exception('$key not found in environment variables');
    }
    return value;
  }
}
