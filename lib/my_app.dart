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

import './config.dart';

class MyApp extends StatelessWidget {
  final FirebaseApp app;
  final Config config;

  MyApp({this.app, this.config});

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
