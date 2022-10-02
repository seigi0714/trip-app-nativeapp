// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return macos;
      // ignore: no_default_cases
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
    appId: '1:274154645467:ios:4b2681de234aa7a420a9fe',
    messagingSenderId: '274154645467',
    projectId: 'trip-app-dev',
    storageBucket: 'trip-app-dev.appspot.com',
    iosClientId:
        '274154645467-9eacjmei6kajirgfad6lbac6ri186lm4.apps.googleusercontent.com',
    iosBundleId: 'com.seigiruka.tripAppNativeapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAKoxY3_D8xhSfQn0an3ClIuRfd599dakA',
    appId: '1:274154645467:ios:4b2681de234aa7a420a9fe',
    messagingSenderId: '274154645467',
    projectId: 'trip-app-dev',
    storageBucket: 'trip-app-dev.appspot.com',
    iosClientId:
        '274154645467-9eacjmei6kajirgfad6lbac6ri186lm4.apps.googleusercontent.com',
    iosBundleId: 'com.seigiruka.tripAppNativeapp',
  );
}
