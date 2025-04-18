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
    apiKey: 'AIzaSyDlGMUWQE7RjJi3IDWlKzWXWxm2d2jvXcw',
    appId: '1:506136688278:web:df34132430971c440934b7',
    messagingSenderId: '506136688278',
    projectId: 'untitled7-af7f4',
    authDomain: 'untitled7-af7f4.firebaseapp.com',
    storageBucket: 'untitled7-af7f4.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDb7alxBrZ0bCe40r0jLIkxnu17qclVSp8',
    appId: '1:506136688278:android:fdf17a6f3770deb90934b7',
    messagingSenderId: '506136688278',
    projectId: 'untitled7-af7f4',
    storageBucket: 'untitled7-af7f4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUjV1xGdYSR0aMPEGBeX2KnFeA0BZY45s',
    appId: '1:506136688278:ios:2e6ab61a789ba3ae0934b7',
    messagingSenderId: '506136688278',
    projectId: 'untitled7-af7f4',
    storageBucket: 'untitled7-af7f4.firebasestorage.app',
    iosBundleId: 'com.example.untitled7',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUjV1xGdYSR0aMPEGBeX2KnFeA0BZY45s',
    appId: '1:506136688278:ios:2e6ab61a789ba3ae0934b7',
    messagingSenderId: '506136688278',
    projectId: 'untitled7-af7f4',
    storageBucket: 'untitled7-af7f4.firebasestorage.app',
    iosBundleId: 'com.example.untitled7',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDlGMUWQE7RjJi3IDWlKzWXWxm2d2jvXcw',
    appId: '1:506136688278:web:2e27fb0401ae519e0934b7',
    messagingSenderId: '506136688278',
    projectId: 'untitled7-af7f4',
    authDomain: 'untitled7-af7f4.firebaseapp.com',
    storageBucket: 'untitled7-af7f4.firebasestorage.app',
  );

}