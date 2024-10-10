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
    apiKey: 'AIzaSyBdcLrCwHPoLfIrvU21ZBz0OnD6EOExqWs',
    appId: '1:735950578627:web:23897d96558d72c182d376',
    messagingSenderId: '735950578627',
    projectId: 'abcdigikids-d5cac',
    authDomain: 'abcdigikids-d5cac.firebaseapp.com',
    storageBucket: 'abcdigikids-d5cac.appspot.com',
    measurementId: 'G-6VRZDP5EGN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCADIwLA1s-F0JFL6h96igI-CwuXFD_UsA',
    appId: '1:735950578627:android:87f30467b727315682d376',
    messagingSenderId: '735950578627',
    projectId: 'abcdigikids-d5cac',
    storageBucket: 'abcdigikids-d5cac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDyNZOtKo4kZ8LFVdvoRV_tG4LyVHlqQY',
    appId: '1:735950578627:ios:6a018c404919717b82d376',
    messagingSenderId: '735950578627',
    projectId: 'abcdigikids-d5cac',
    storageBucket: 'abcdigikids-d5cac.appspot.com',
    iosBundleId: 'com.example.abcdigikids',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDyNZOtKo4kZ8LFVdvoRV_tG4LyVHlqQY',
    appId: '1:735950578627:ios:6a018c404919717b82d376',
    messagingSenderId: '735950578627',
    projectId: 'abcdigikids-d5cac',
    storageBucket: 'abcdigikids-d5cac.appspot.com',
    iosBundleId: 'com.example.abcdigikids',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBdcLrCwHPoLfIrvU21ZBz0OnD6EOExqWs',
    appId: '1:735950578627:web:61142c217c0760b282d376',
    messagingSenderId: '735950578627',
    projectId: 'abcdigikids-d5cac',
    authDomain: 'abcdigikids-d5cac.firebaseapp.com',
    storageBucket: 'abcdigikids-d5cac.appspot.com',
    measurementId: 'G-28VHDL51PF',
  );

}