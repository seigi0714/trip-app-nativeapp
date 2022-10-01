import 'package:flutter/material.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';

import 'config/app.dart';
import 'env/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LineSDK.instance.setup(Env.lineChannelId);
  runApp(
    const TripApp(),
  );
}
