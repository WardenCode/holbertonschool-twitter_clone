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
    apiKey: 'AIzaSyAiXIFyfNUaJgiHdIuZ447lupUq8wiKeNA',
    appId: '1:399077021386:web:082c45d96ab9d423638633',
    messagingSenderId: '399077021386',
    projectId: 'twitterclone-7f45a',
    authDomain: 'twitterclone-7f45a.firebaseapp.com',
    storageBucket: 'twitterclone-7f45a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB82WhhmTieqv-FgqSXdWZ4-JzMRh94AAA',
    appId: '1:399077021386:android:00625876f58425f5638633',
    messagingSenderId: '399077021386',
    projectId: 'twitterclone-7f45a',
    storageBucket: 'twitterclone-7f45a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFvs7kFTmlrPThUWhu0k3ZxKSdWmR30-c',
    appId: '1:399077021386:ios:9a186cdf1fe95dc9638633',
    messagingSenderId: '399077021386',
    projectId: 'twitterclone-7f45a',
    storageBucket: 'twitterclone-7f45a.appspot.com',
    iosClientId: '399077021386-bfefemoprlr4npm7l6bvjf0qqedijnsc.apps.googleusercontent.com',
    iosBundleId: 'com.example.twitter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFvs7kFTmlrPThUWhu0k3ZxKSdWmR30-c',
    appId: '1:399077021386:ios:2f0bf4c121a5ce79638633',
    messagingSenderId: '399077021386',
    projectId: 'twitterclone-7f45a',
    storageBucket: 'twitterclone-7f45a.appspot.com',
    iosClientId: '399077021386-3s472gv9ktmnvbg3spuaqn79f49ua4tp.apps.googleusercontent.com',
    iosBundleId: 'com.example.twitter.RunnerTests',
  );
}