import 'package:flutter/material.dart';

class AnimatedSwitcherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Animated Switcher'),
        ),
        body: _AnimatedViewBody());
    ;
  }
}

class _AnimatedViewBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedViewBodyState();
}

class _AnimatedViewBodyState extends State<_AnimatedViewBody> {
  int toggle = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          switchInCurve: Curves.easeInBack,
          switchOutCurve: Curves.easeOutBack,
          transitionBuilder: (Widget child, Animation<double> animation) {
            final inAnimation =
                Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation);
            final outAnimation =
                Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(animation);

            return SlideTransition(
              position: child.key == Key('0') ? outAnimation : inAnimation,
              child: child,
            );
          },
          child: toggle == 0
              ? Container(
                  key: Key('0'),
                  height: 80,
                  child: Center(child: Text('Widget A')))
              : Container(
                  key: Key('1'),
                  color: Colors.red,
                  height: 80,
                  child: Center(child: Text('Widget B')))),
      Row(children: [
        Expanded(
            child: RaisedButton(
          child: Text('toggle'),
          onPressed: () {
            setState(() {
              toggle = toggle == 0 ? 1 : 0;
            });
          },
        ))
      ])
    ]);
  }
}
