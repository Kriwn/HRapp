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
    apiKey: 'AIzaSyDaOFqrZRrM5tlJMz-mzf0oUH93itgrryI',
    appId: '1:577491611644:web:1d17617cfaadc72ced4c79',
    messagingSenderId: '577491611644',
    projectId: 'hrapp-f538c',
    authDomain: 'hrapp-f538c.firebaseapp.com',
    storageBucket: 'hrapp-f538c.appspot.com',
    measurementId: 'G-GDHDPN7STJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdDjIX5ntr84pb0p-Nglddvhvh5BBvWXk',
    appId: '1:577491611644:android:59ff9311c743739bed4c79',
    messagingSenderId: '577491611644',
    projectId: 'hrapp-f538c',
    storageBucket: 'hrapp-f538c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDnYVbzkwY2kvhm0YHSu1DlkLyBlYC7Izs',
    appId: '1:577491611644:ios:f187625d4ed56bbced4c79',
    messagingSenderId: '577491611644',
    projectId: 'hrapp-f538c',
    storageBucket: 'hrapp-f538c.appspot.com',
    iosBundleId: 'com.example.hr',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDnYVbzkwY2kvhm0YHSu1DlkLyBlYC7Izs',
    appId: '1:577491611644:ios:6a8f90f938007b31ed4c79',
    messagingSenderId: '577491611644',
    projectId: 'hrapp-f538c',
    storageBucket: 'hrapp-f538c.appspot.com',
    iosBundleId: 'com.example.hr.RunnerTests',
  );
}
