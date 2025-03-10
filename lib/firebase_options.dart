
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
    apiKey: 'AIzaSyBQW189_-mwGuBqWp9pVHdBYEi_CAuMGFI',
    appId: '1:558263618065:web:a1b7aac0192d9c2163bfb0',
    messagingSenderId: '558263618065',
    projectId: 'philatelix-ecommerce-app',
    authDomain: 'philatelix-ecommerce-app.firebaseapp.com',
    storageBucket: 'philatelix-ecommerce-app.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDOvk-2q9XAoD0HP0xy1UqtfEZEPblBHHo',
    appId: '1:558263618065:android:6ad56f4a8f6cd1d663bfb0',
    messagingSenderId: '558263618065',
    projectId: 'philatelix-ecommerce-app',
    storageBucket: 'philatelix-ecommerce-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1ppZQbx7Imck7hcHItwk4IXDuE-yK8yQ',
    appId: '1:558263618065:ios:e6a596258cdf603d63bfb0',
    messagingSenderId: '558263618065',
    projectId: 'philatelix-ecommerce-app',
    storageBucket: 'philatelix-ecommerce-app.firebasestorage.app',
    iosBundleId: 'com.example.philately',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBQW189_-mwGuBqWp9pVHdBYEi_CAuMGFI',
    appId: '1:558263618065:web:758156aacd318f8f63bfb0',
    messagingSenderId: '558263618065',
    projectId: 'philatelix-ecommerce-app',
    authDomain: 'philatelix-ecommerce-app.firebaseapp.com',
    storageBucket: 'philatelix-ecommerce-app.firebasestorage.app',
  );
}
