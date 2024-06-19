// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBe8TgRYMhLLn5fajuFJ30maGor7ufdi6s',
    appId: '1:394927965303:web:ad28717d62207240ecf272',
    messagingSenderId: '394927965303',
    projectId: 'deep-flutter-6bead',
    authDomain: 'deep-flutter-6bead.firebaseapp.com',
    storageBucket: 'deep-flutter-6bead.appspot.com',
    measurementId: 'G-87WHB6D63F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_FUPYi9WAZSjawpZrEnqFENaw2165zCk',
    appId: '1:394927965303:android:60c62cfa320ab451ecf272',
    messagingSenderId: '394927965303',
    projectId: 'deep-flutter-6bead',
    storageBucket: 'deep-flutter-6bead.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAb9N77AbDxCGqcErUHrfxFcZPVXox1DTE',
    appId: '1:394927965303:ios:2ddd1bd9d4a37ce2ecf272',
    messagingSenderId: '394927965303',
    projectId: 'deep-flutter-6bead',
    storageBucket: 'deep-flutter-6bead.appspot.com',
    iosBundleId: 'com.example.deepFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAb9N77AbDxCGqcErUHrfxFcZPVXox1DTE',
    appId: '1:394927965303:ios:2ddd1bd9d4a37ce2ecf272',
    messagingSenderId: '394927965303',
    projectId: 'deep-flutter-6bead',
    storageBucket: 'deep-flutter-6bead.appspot.com',
    iosBundleId: 'com.example.deepFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBe8TgRYMhLLn5fajuFJ30maGor7ufdi6s',
    appId: '1:394927965303:web:5d433ace3270d820ecf272',
    messagingSenderId: '394927965303',
    projectId: 'deep-flutter-6bead',
    authDomain: 'deep-flutter-6bead.firebaseapp.com',
    storageBucket: 'deep-flutter-6bead.appspot.com',
    measurementId: 'G-V40325R35R',
  );
}
