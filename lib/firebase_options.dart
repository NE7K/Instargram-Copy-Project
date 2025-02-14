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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZO8otRWISrfLs8v4c6ud7DXHPelSxobk',
    appId: '1:960175995242:android:ab25040621047e1d8fcd13',
    messagingSenderId: '960175995242',
    projectId: 'fluttergram-3d261',
    storageBucket: 'fluttergram-3d261.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMi4Z8nTTN8USZ0ifW-e3RZwSmf0hie6s',
    appId: '1:960175995242:ios:6f2fc6a192158cc48fcd13',
    messagingSenderId: '960175995242',
    projectId: 'fluttergram-3d261',
    storageBucket: 'fluttergram-3d261.firebasestorage.app',
    iosBundleId: 'com.neighbrosoft.sns.instargramcopy',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyClizK0i7tORG8wJ6ipO80cRSjff2FZNxU',
    appId: '1:960175995242:web:8a20bdcdb1b1d5e58fcd13',
    messagingSenderId: '960175995242',
    projectId: 'fluttergram-3d261',
    authDomain: 'fluttergram-3d261.firebaseapp.com',
    storageBucket: 'fluttergram-3d261.firebasestorage.app',
  );

}