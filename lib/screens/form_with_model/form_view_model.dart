import 'package:flutter/material.dart';
import 'package:flutter_practice/domain/user2.dart';

class FormViewModel with ChangeNotifier {
  final User2 user;
  final List<User2> userList;

  FormViewModel()
      : user = User2(),
        userList = List<User2>();

  String getLoginId() {
    return user.loginId;
  }

  List<User2> getUserList() {
    return userList;
  }

  String validateLoginId(String value) {
    if (!user.validateLoginId(value)) {
      return '5文字以上で入力してください';
    }
    return null;
  }

  void setLoginId(String loginId) {
    user.loginId = loginId;
  }

  void register() {
    User2 newUser = User2(loginId: user.loginId);
    userList.add(newUser);
    notifyListeners();
  }
}
