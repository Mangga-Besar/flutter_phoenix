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
    apiKey: 'AIzaSyDnMI682xLVN8rM6Gp7qMd3svr3xnAtzSI',
    appId: '1:785798195005:web:6c1e4325a9c28224688754',
    messagingSenderId: '785798195005',
    projectId: 'phoenix-cc-706a1',
    authDomain: 'phoenix-cc-706a1.firebaseapp.com',
    storageBucket: 'phoenix-cc-706a1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0FaH3Zj_o0D89zodqQ8P309uuQMZDEME',
    appId: '1:785798195005:android:ad80702ed1393f46688754',
    messagingSenderId: '785798195005',
    projectId: 'phoenix-cc-706a1',
    storageBucket: 'phoenix-cc-706a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAK8G1GfoEfEe578VZUyUI5BjZFxlzUk4k',
    appId: '1:785798195005:ios:d156cacbdc6c14ba688754',
    messagingSenderId: '785798195005',
    projectId: 'phoenix-cc-706a1',
    storageBucket: 'phoenix-cc-706a1.appspot.com',
    iosClientId:
        '785798195005-d8jn0atb88ial86t04oiv9lqehdt8jq4.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterPhoenix',
  );
}
