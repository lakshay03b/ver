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
    apiKey: 'AIzaSyCM8EMvqtS9TIHUVBMii5ryvThFM8Z6Rdg',
    appId: '1:345322454278:web:05b3acbd97dc50ab0d7287',
    messagingSenderId: '345322454278',
    projectId: 'testing-58e32',
    authDomain: 'testing-58e32.firebaseapp.com',
    storageBucket: 'testing-58e32.appspot.com',
    measurementId: 'G-LKQ245BX4N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9g2IDh62Y9t9IJnkor0_naTYZNFon2Gc',
    appId: '1:345322454278:android:16fb7a06ef6059280d7287',
    messagingSenderId: '345322454278',
    projectId: 'testing-58e32',
    storageBucket: 'testing-58e32.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpBr-f-hJAxnXJoRphfoselUih3qCkfWI',
    appId: '1:345322454278:ios:37afe229c10d14d00d7287',
    messagingSenderId: '345322454278',
    projectId: 'testing-58e32',
    storageBucket: 'testing-58e32.appspot.com',
    iosBundleId: 'com.example.ver',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpBr-f-hJAxnXJoRphfoselUih3qCkfWI',
    appId: '1:345322454278:ios:37afe229c10d14d00d7287',
    messagingSenderId: '345322454278',
    projectId: 'testing-58e32',
    storageBucket: 'testing-58e32.appspot.com',
    iosBundleId: 'com.example.ver',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCM8EMvqtS9TIHUVBMii5ryvThFM8Z6Rdg',
    appId: '1:345322454278:web:e16abf00142d9a3b0d7287',
    messagingSenderId: '345322454278',
    projectId: 'testing-58e32',
    authDomain: 'testing-58e32.firebaseapp.com',
    storageBucket: 'testing-58e32.appspot.com',
    measurementId: 'G-BS7RDP435P',
  );
}
