import 'package:flutter/material.dart';
import 'package:flutter_practice/screens/form.dart';
import 'package:flutter_practice/screens/form_with_model/form.dart';
import 'package:flutter_practice/screens/layout_practice.dart';
import 'package:flutter_practice/screens/practice_menu.dart';
import 'package:flutter_practice/screens/state_with_inherit.dart';
import 'package:flutter_practice/screens/state_with_provider/state_with_provider.dart';
import 'package:flutter_practice/screens/web_api.dart';

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
        '/layout-practice': (BuildContext context) => LayoutPractice(),
        '/state-with-inherit': (BuildContext context) => StateWithInherit(),
        '/state-with-provider': (BuildContext context) => StateWithProvider(),
        '/web-api': (BuildContext context) => WebApi(),
        '/form': (BuildContext context) => FormScreen(),
        '/form_with_model': (BuildContext context) => FormWithModelScreen(),
      },
      home: PracticeMenu(),
    );
  }
}
