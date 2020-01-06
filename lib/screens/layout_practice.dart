import 'package:flutter/material.dart';

class LayoutPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('レイアウト基礎'),
        ),
      body: Container(
        child: Text('レイアウト練習')
      ),
    );
  }
}
