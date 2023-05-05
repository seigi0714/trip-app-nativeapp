// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCL4NKhYjipHEncMVQBgKWe918Twxfb9sQ',
    appId: '1:274154645467:web:ab77cd30dc9c474920a9fe',
    messagingSenderId: '274154645467',
    projectId: 'trip-app-dev',
    authDomain: 'trip-app-dev.firebaseapp.com',
    storageBucket: 'trip-app-dev.appspot.com',
    measurementId: 'G-87JZM3VWYL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZpptrJlhsMuH8iP1ymj9uUMvIOLkrT_4',
    appId: '1:274154645467:android:a5703c830b5b568e20a9fe',
    messagingSenderId: '274154645467',
    projectId: 'trip-app-dev',
    storageBucket: 'trip-app-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKoxY3_D8xhSfQn0an3ClIuRfd599dakA',
    appId: '1:274154645467:ios:79c45384908764cb20a9fe',
    messagingSenderId: '274154645467',
    projectId: 'trip-app-dev',
    storageBucket: 'trip-app-dev.appspot.com',
    androidClientId:
        '274154645467-p34l37fbu6m8t1dbamq1q0mfd5m69627.apps.googleusercontent.com',
    iosClientId:
        '274154645467-shdsfi756l8mtds2fgdu3dm2j4n5pqu8.apps.googleusercontent.com',
    iosBundleId: 'com.seigiruka.tripapp',
  );
}
