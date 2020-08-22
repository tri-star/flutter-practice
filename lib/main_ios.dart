import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './config.dart';
import './my_app.dart';

void main() {

  Config config = Config(googleAppId: '1:918322228342:ios:52c3baadf84b11ce580357');

  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp.configure(
      name: 'flutter_practice',
      options: FirebaseOptions(
        googleAppID: config.googleAppId,
        gcmSenderID: '918322228342',
        apiKey: 'AIzaSyAHmIXAE7lqqmeI0uTGEVxvDGIFT81lSMw',
        projectID: 'flutter-practice-7ee52',
      )).then((FirebaseApp app) {
    Firestore(app: app);
    return app;
  }).then((FirebaseApp app) {
    runApp(MyApp(app: app));
  });
}
