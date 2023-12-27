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
    apiKey: 'AIzaSyBMPgJInMJGSepL25uBzmeum6SxS6wIULA',
    appId: '1:581733578471:web:d1f50fc813a3b36c591442',
    messagingSenderId: '581733578471',
    projectId: 'firstflutterfirebase-bc68c',
    authDomain: 'firstflutterfirebase-bc68c.firebaseapp.com',
    storageBucket: 'firstflutterfirebase-bc68c.appspot.com',
    measurementId: 'G-HQ7K45CM6W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaXhAe2N0_gfNmZVJfR0N9XlwYmVOTs1c',
    appId: '1:581733578471:android:1e9917012dd87b25591442',
    messagingSenderId: '581733578471',
    projectId: 'firstflutterfirebase-bc68c',
    storageBucket: 'firstflutterfirebase-bc68c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkfsxaJio4qiyHRO4NyUsVL92ng5MiNNI',
    appId: '1:581733578471:ios:69fa351b2bd4b1f4591442',
    messagingSenderId: '581733578471',
    projectId: 'firstflutterfirebase-bc68c',
    storageBucket: 'firstflutterfirebase-bc68c.appspot.com',
    iosBundleId: 'com.example.firstyyy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDkfsxaJio4qiyHRO4NyUsVL92ng5MiNNI',
    appId: '1:581733578471:ios:4373e521f4f66b12591442',
    messagingSenderId: '581733578471',
    projectId: 'firstflutterfirebase-bc68c',
    storageBucket: 'firstflutterfirebase-bc68c.appspot.com',
    iosBundleId: 'com.example.firstyyy.RunnerTests',
  );
}
