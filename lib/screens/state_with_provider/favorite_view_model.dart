import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_practice/domain/favorite.dart';

class FavoriteViewModel extends ChangeNotifier {

  final Favorite favorite;

  FavoriteViewModel(): favorite = Favorite(0);

  int getCount() {
    return favorite.getCount();
  }

  void increment() {
    favorite.increment();
    notifyListeners();
  }
}
