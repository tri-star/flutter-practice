import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import './config.dart';
import './my_app.dart';

void main() {
  Config config =
      Config(googleAppId: '1:918322228342:android:f246753ffc9f773b580357');

  WidgetsFlutterBinding.ensureInitialized();
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  Firebase.initializeApp(
      name: 'flutter_practice',
      options: FirebaseOptions(
        appId: config.googleAppId,
        messagingSenderId: '918322228342',
        apiKey: 'AIzaSyAHmIXAE7lqqmeI0uTGEVxvDGIFT81lSMw',
        projectId: 'flutter-practice-7ee52',
      )).then((FirebaseApp app) {
    runApp(MyApp(app: app));
  });
}
