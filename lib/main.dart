import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/screens/animated_switcher.dart';
import 'package:flutter_practice/screens/auth/index.dart';
import 'package:flutter_practice/screens/firestore/index.dart';
import 'package:flutter_practice/screens/form.dart';
import 'package:flutter_practice/screens/form_with_model/form.dart';
import 'package:flutter_practice/screens/layout_practice.dart';
import 'package:flutter_practice/screens/practice_menu.dart';
import 'package:flutter_practice/screens/state_with_inherit.dart';
import 'package:flutter_practice/screens/state_with_provider/state_with_provider.dart';
import 'package:flutter_practice/screens/web_api.dart';

Future<FirebaseApp> initFireBaseApp() {
  return FirebaseApp.configure(
      name: 'flutter_practice',
      options: const FirebaseOptions(
        googleAppID: '1:918322228342:android:f246753ffc9f773b580357',
        gcmSenderID: '918322228342',
        apiKey: 'AIzaSyAHmIXAE7lqqmeI0uTGEVxvDGIFT81lSMw',
        projectID: 'flutter-practice-7ee52',
      ));
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp.configure(
      name: 'flutter_practice',
      options: const FirebaseOptions(
        googleAppID: '1:918322228342:android:f246753ffc9f773b580357',
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

class MyApp extends StatelessWidget {
  final FirebaseApp app;

  MyApp({this.app});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/layout-practice': (BuildContext context) => LayoutPractice(),
        '/state-with-inherit': (BuildContext context) => StateWithInherit(),
        '/state-with-provider': (BuildContext context) => StateWithProvider(),
        '/web-api': (BuildContext context) => WebApi(),
        '/form': (BuildContext context) => FormScreen(),
        '/form_with_model': (BuildContext context) => FormWithModelScreen(),
        '/firestore': (BuildContext context) => IndexPageTabView(),
        '/firebase_auth': (BuildContext context) => AuthIndex(),
        '/animated_switcher': (BuildContext context) => AnimatedSwitcherView(),
      },
      home: PracticeMenu(),
    );
  }
}
