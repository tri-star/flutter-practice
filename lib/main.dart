import 'package:flutter/material.dart';
import 'package:flutter_practice/screens/practice_menu.dart';

import 'package:flutter_practice/screens/layout_practice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/layout-practice': (BuildContext context) => LayoutPractice()
      },
      home: PracticeMenu(),

    );
  }
}
