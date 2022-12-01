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
    apiKey: 'AIzaSyAK7MAPchFkef3mosGNwq_DSjnvMS34i_8',
    appId: '1:603752801028:web:7740dd6d3650c0e2242651',
    messagingSenderId: '603752801028',
    projectId: 'appflutter-76609',
    authDomain: 'appflutter-76609.firebaseapp.com',
    storageBucket: 'appflutter-76609.appspot.com',
    measurementId: 'G-S30PRFV293',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDddNZfm-2rKk1urLuciTnZfOUs4AuKTQY',
    appId: '1:603752801028:android:d13bfa5be159c144242651',
    messagingSenderId: '603752801028',
    projectId: 'appflutter-76609',
    storageBucket: 'appflutter-76609.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrdyq1oTMNC38vyB2bE7jVxdeRspJJMZc',
    appId: '1:603752801028:ios:00251dc749bf3e70242651',
    messagingSenderId: '603752801028',
    projectId: 'appflutter-76609',
    storageBucket: 'appflutter-76609.appspot.com',
    iosClientId: '603752801028-d9d3kfvcqe5bt5ka5t8m50pnk1iifarq.apps.googleusercontent.com',
    iosBundleId: 'com.example.randomDados',
  );
}