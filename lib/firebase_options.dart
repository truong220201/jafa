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
    apiKey: 'AIzaSyDF4FpgS1Cnu6-WJ12ePiS_O-9_eyxnK8o',
    appId: '1:1064274526643:web:a8b03ca13c6dc7101ccbc6',
    messagingSenderId: '1064274526643',
    projectId: 'jafa-f716c',
    authDomain: 'jafa-f716c.firebaseapp.com',
    storageBucket: 'jafa-f716c.appspot.com',
    measurementId: 'G-BXPN5S9H5Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBxO8pFEUpHDozG2HATI1WrrcBuA-UQTBY',
    appId: '1:1064274526643:android:afc4e8fbab867db31ccbc6',
    messagingSenderId: '1064274526643',
    projectId: 'jafa-f716c',
    storageBucket: 'jafa-f716c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrDeC5s34Qfaop8nVgchF4tv5bp5NZmqM',
    appId: '1:1064274526643:ios:5e2371312ee685f41ccbc6',
    messagingSenderId: '1064274526643',
    projectId: 'jafa-f716c',
    storageBucket: 'jafa-f716c.appspot.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrDeC5s34Qfaop8nVgchF4tv5bp5NZmqM',
    appId: '1:1064274526643:ios:a667972e6f357b2e1ccbc6',
    messagingSenderId: '1064274526643',
    projectId: 'jafa-f716c',
    storageBucket: 'jafa-f716c.appspot.com',
    iosBundleId: 'com.example.flutterFirebase.RunnerTests',
  );
}
