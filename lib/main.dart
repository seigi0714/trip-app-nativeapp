import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:trip_app_nativeapp/core/env.dart';
import 'package:trip_app_nativeapp/core/firebase_options.dart';
import 'package:trip_app_nativeapp/core/trip_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final env = await Env.fromFlavor(
    Flavor.fromString(const String.fromEnvironment('FLAVOR')),
  );
  await LineSDK.instance.setup(env.lineChannelId);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    TripApp(
      overrides: [
        envProvider.overrideWithValue(env),
      ],
    ),
  );
}
