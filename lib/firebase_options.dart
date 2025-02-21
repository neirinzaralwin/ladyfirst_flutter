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
    apiKey: 'AIzaSyBXacV8gR4wR5SNqGHI0HL-VzqI19TPM9E',
    appId: '1:223897335964:web:76b1ca291598854a4d1559',
    messagingSenderId: '223897335964',
    projectId: 'ladyfirst-64370',
    authDomain: 'ladyfirst-64370.firebaseapp.com',
    storageBucket: 'ladyfirst-64370.firebasestorage.app',
    measurementId: 'G-Q3F6BZKHB5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKDXBu89ntJu2g_TWmtL5fjtk1uSK1b38',
    appId: '1:223897335964:android:0064ac11458f8f0a4d1559',
    messagingSenderId: '223897335964',
    projectId: 'ladyfirst-64370',
    storageBucket: 'ladyfirst-64370.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXsNXpJ_kgpW6Jer_9Fx82dCl0gdyvnzU',
    appId: '1:223897335964:ios:0589954d0ec67eba4d1559',
    messagingSenderId: '223897335964',
    projectId: 'ladyfirst-64370',
    storageBucket: 'ladyfirst-64370.firebasestorage.app',
    iosBundleId: 'com.example.ladyFirstFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXsNXpJ_kgpW6Jer_9Fx82dCl0gdyvnzU',
    appId: '1:223897335964:ios:0589954d0ec67eba4d1559',
    messagingSenderId: '223897335964',
    projectId: 'ladyfirst-64370',
    storageBucket: 'ladyfirst-64370.firebasestorage.app',
    iosBundleId: 'com.example.ladyFirstFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBXacV8gR4wR5SNqGHI0HL-VzqI19TPM9E',
    appId: '1:223897335964:web:a310e8927e15d0624d1559',
    messagingSenderId: '223897335964',
    projectId: 'ladyfirst-64370',
    authDomain: 'ladyfirst-64370.firebaseapp.com',
    storageBucket: 'ladyfirst-64370.firebasestorage.app',
    measurementId: 'G-8HVP7Z7D5W',
  );

}