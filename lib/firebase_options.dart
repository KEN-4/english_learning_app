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
    apiKey: 'AIzaSyCvf6vHtmBA3WCXKiz5mvCAv2FzRzY2W6U',
    appId: '1:112062077543:web:9e2a0a68ef27d98bb9d2c2',
    messagingSenderId: '112062077543',
    projectId: 'english-learning-app-2023',
    authDomain: 'english-learning-app-2023.firebaseapp.com',
    storageBucket: 'english-learning-app-2023.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCllgqpHdGedV7YH8vX2GrFCO3USAk4xzc',
    appId: '1:112062077543:android:5d58394b051576edb9d2c2',
    messagingSenderId: '112062077543',
    projectId: 'english-learning-app-2023',
    storageBucket: 'english-learning-app-2023.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcSjnIpKy162cYAiWjFpxNIkK7rYMnBD8',
    appId: '1:112062077543:ios:ccc4e957031c4c3eb9d2c2',
    messagingSenderId: '112062077543',
    projectId: 'english-learning-app-2023',
    storageBucket: 'english-learning-app-2023.appspot.com',
    iosBundleId: 'com.example.englishLearningApp',
  );
}
