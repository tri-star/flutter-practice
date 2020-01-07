import 'package:flutter/material.dart';



class StateWithInherit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('状態管理: InheritWidget')),
      body: ButtonArea(),
    );
  }

}


class ButtonArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: const FavoriteCounter()
        )
      ]
    );
  }

}


class FavoriteCounter extends StatefulWidget {

  const FavoriteCounter({ Key key }): super(key: key);

  @override
  State<StatefulWidget> createState()  => FavoriteCounterState();
}

class FavoriteCounterState extends State<FavoriteCounter> {

  int count = 0;

  void incrementCount() {
    setState(() => count++);
  }

  @override
  Widget build(BuildContext context) {
    return FavoriteCounterInherited(
      count: count,
      //コンポーネントが複雑になってくるとこの部分でコンポーネントが分かれて、
      //その場合に上位のコンポーネントが持っている値を受け取ったり、
      //上位コンポーネントの値の変化に応じて下位の特定のコンポーネントだけ再レンダリングさせるのに
      //InheritedWidgetが使える。
      //この例ではあまり意味がない
      child: Builder(
        builder: (BuildContext context) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: 100,
                child: Center(
                  child: Text(
                    FavoriteCounterInherited.of(context).getCount().toString()
                  )
                ),
              ),
              Container(
                width: 200,
                child: FlatButton(
                  onPressed: () => incrementCount(),
                  color: Colors.blueGrey[100],
                  child: Text('いいね！')
                )
              )
            ]
          );
        }
      ),
    );
  }

}


class FavoriteCounterInherited extends InheritedWidget {

  int count;

  FavoriteCounterInherited({Key key, @required Widget child, @required int this.count}): super(key: key, child: child);

  static FavoriteCounterInherited of(BuildContext context, {@required bool listen=true}) {
    if(listen) {
      return context.dependOnInheritedWidgetOfExactType<FavoriteCounterInherited>();
    }
    return context.getElementForInheritedWidgetOfExactType<FavoriteCounterInherited>().widget as FavoriteCounterInherited;
  }

  @override
  bool updateShouldNotify(FavoriteCounterInherited old) {
    return count != old.count;
  }

  int getCount() {
    return count;
  }
}
