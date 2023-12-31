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
    apiKey: 'AIzaSyCSyA9flsLKxiUppYVj55KDyoVvG_KuR7Q',
    appId: '1:426912440792:web:a4f3efd60c5ef8622112ad',
    messagingSenderId: '426912440792',
    projectId: 'xsafe-1aea8',
    authDomain: 'xsafe-1aea8.firebaseapp.com',
    storageBucket: 'xsafe-1aea8.appspot.com',
    measurementId: 'G-LVZ9DZK284',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_xyeTUGHbY-F4DRqh7k4kTg_w59VCG20',
    appId: '1:426912440792:android:15b00c8e4202268d2112ad',
    messagingSenderId: '426912440792',
    projectId: 'xsafe-1aea8',
    storageBucket: 'xsafe-1aea8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3AbytKnAwaB2jW90-bz6sH02gxet0PqM',
    appId: '1:426912440792:ios:51d65a00288499ca2112ad',
    messagingSenderId: '426912440792',
    projectId: 'xsafe-1aea8',
    storageBucket: 'xsafe-1aea8.appspot.com',
    iosClientId: '426912440792-0gkc7tlldqppbtou2c08obbsgo4ktt61.apps.googleusercontent.com',
    iosBundleId: 'com.example.safetyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3AbytKnAwaB2jW90-bz6sH02gxet0PqM',
    appId: '1:426912440792:ios:08819d1aa67b5b662112ad',
    messagingSenderId: '426912440792',
    projectId: 'xsafe-1aea8',
    storageBucket: 'xsafe-1aea8.appspot.com',
    iosClientId: '426912440792-m216ksjj2075o5ida03oflmig7k9f2kn.apps.googleusercontent.com',
    iosBundleId: 'com.example.safetyApp.RunnerTests',
  );
}
