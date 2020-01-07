import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_practice/screens/state_with_provider/favorite_view_model.dart';


class StateWithProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('状態管理: provider')),
      body: Column(
        children: [
          Center(
            child: ChangeNotifierProvider(
              create: (context) => FavoriteViewModel(),
              child: const FavoriteCounter(),
            )
          )
        ]
      ),
    );
  }

}


class FavoriteCounter extends StatelessWidget {

  const FavoriteCounter({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: 100,
          child: Center(
            child: Consumer<FavoriteViewModel>(
              builder: (BuildContext context, FavoriteViewModel model, child) {
                return Text(model.getCount().toString());
              }
            )

          ),
        ),
        Container(
          width: 200,
          child: FlatButton(
            onPressed: () => Provider.of<FavoriteViewModel>(context, listen: false).increment(),
            color: Colors.blueGrey[100],
            child: Text('いいね！')
          )
        )
      ]
    );
  }

}
