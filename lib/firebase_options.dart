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
    apiKey: 'AIzaSyD0LQebIAOoq3ETW5bmvsbzeLbL2yF2mlI',
    appId: '1:1064559785427:web:6bc2a7134bb6e08b30ab26',
    messagingSenderId: '1064559785427',
    projectId: 'reddit-clone-8a785',
    authDomain: 'reddit-clone-8a785.firebaseapp.com',
    storageBucket: 'reddit-clone-8a785.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvK4Y8YlhRRgzFRQAO9o3jJ59_b6O68GY',
    appId: '1:1064559785427:android:f7cd7c0667decacf30ab26',
    messagingSenderId: '1064559785427',
    projectId: 'reddit-clone-8a785',
    storageBucket: 'reddit-clone-8a785.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAkcJyqE70WQScoknkLWiaDBO6sjANBVo',
    appId: '1:1064559785427:ios:6d41431a3e69db0b30ab26',
    messagingSenderId: '1064559785427',
    projectId: 'reddit-clone-8a785',
    storageBucket: 'reddit-clone-8a785.appspot.com',
    iosBundleId: 'com.example.redditClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBAkcJyqE70WQScoknkLWiaDBO6sjANBVo',
    appId: '1:1064559785427:ios:82950f661d93a8c230ab26',
    messagingSenderId: '1064559785427',
    projectId: 'reddit-clone-8a785',
    storageBucket: 'reddit-clone-8a785.appspot.com',
    iosBundleId: 'com.example.redditClone.RunnerTests',
  );
}
