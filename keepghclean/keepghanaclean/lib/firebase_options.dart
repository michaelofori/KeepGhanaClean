import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyBPYMzWk8kmN3n-lEHk8lPD4VAuDTK66ZY',
    appId: '1:648475629951:web:c004175a4a15683478224a',
    messagingSenderId: '648475629951',
    projectId: 'keepghclean-10113',
    authDomain: 'keepghclean-10113.firebaseapp.com',
    storageBucket: 'keepghclean-10113.appspot.com',
    measurementId: 'G-7GNWZY6KJJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDdKlKK2zsWHltj3BHoo1IEnsnzS2er41w',
    appId: '1:648475629951:android:6a9e2003555def3c78224a',
    messagingSenderId: '648475629951',
    projectId: 'keepghclean-10113',
    storageBucket: 'keepghclean-10113.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkN9BSddnr6dhSgwOzJfCKcofPK1gH_c4',
    appId: '1:648475629951:ios:90ea4f315919d45178224a',
    messagingSenderId: '648475629951',
    projectId: 'keepghclean-10113',
    storageBucket: 'keepghclean-10113.appspot.com',
    iosClientId: '648475629951-r4ldd7og6dtaom40ot1sqkf459svc9ut.apps.googleusercontent.com',
    iosBundleId: 'com.example.keepghanaclean',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkN9BSddnr6dhSgwOzJfCKcofPK1gH_c4',
    appId: '1:648475629951:ios:90ea4f315919d45178224a',
    messagingSenderId: '648475629951',
    projectId: 'keepghclean-10113',
    storageBucket: 'keepghclean-10113.appspot.com',
    iosClientId: '648475629951-r4ldd7og6dtaom40ot1sqkf459svc9ut.apps.googleusercontent.com',
    iosBundleId: 'com.example.keepghanaclean',
  );
}
