import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(
    varName: 'LINE_CHANNEL_ID',
    obfuscate: true,
  )
  static final lineChannelId = _Env.lineChannelId;
  @EnviedField(
    varName: 'INET',
  )
  static final inet = _Env.inet;
  @EnviedField(
    varName: 'PORT',
  )
  static final port = _Env.port;
}
