import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_line_sdk/flutter_line_sdk.dart';
import 'package:trip_app_nativeapp/core/env.dart';
import 'package:trip_app_nativeapp/core/firebase_options.dart';
import 'package:trip_app_nativeapp/core/trip_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Env.fileName);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LineSDK.instance.setup(Env.lineChannelId);
  runApp(
    const TripApp(),
  );
}
