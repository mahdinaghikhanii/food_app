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
    apiKey: 'AIzaSyBDkgYXrCpxBt-O1ggonPc-ort_d2oe8Vs',
    appId: '1:9547984992:web:4f0592c194092fc4029305',
    messagingSenderId: '9547984992',
    projectId: 'food-3db7e',
    authDomain: 'food-3db7e.firebaseapp.com',
    storageBucket: 'food-3db7e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiknf-JhUYgQCRDn1ocrYzZbyxUwpat5Y',
    appId: '1:9547984992:android:7f7a223aa389b5d9029305',
    messagingSenderId: '9547984992',
    projectId: 'food-3db7e',
    storageBucket: 'food-3db7e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-KdpjMfiA2_0k3IPILxBXWggu2T--Eew',
    appId: '1:9547984992:ios:1a04e0825d7831bc029305',
    messagingSenderId: '9547984992',
    projectId: 'food-3db7e',
    storageBucket: 'food-3db7e.appspot.com',
    iosClientId: '9547984992-6la2elobk4piik25qd3tgb610mqautmm.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodFirebase',
  );
}
