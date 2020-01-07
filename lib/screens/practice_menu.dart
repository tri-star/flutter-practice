
import 'package:flutter/material.dart';

class PracticeMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter practice menu')
      ),
      body: new MenuList()
    );
  }
}


class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MenuItem(title: 'レイアウト基礎', onTap: () {
          Navigator.of(context).pushNamed('/layout-practice');
        }),
        MenuItem(title: '状態管理: InheritWidget', onTap: () {
          Navigator.of(context).pushNamed('/state-with-inherit');
        }),
      ]
    );
  }
}


class MenuItem extends StatelessWidget {
  String title;
  VoidCallback onTap;

  MenuItem({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
            Container(
              height: 60,
              child: Center(
                child: Text(title)),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300])
                )
              ),
            )
        ],
      )
    );
  }
}
