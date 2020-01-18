class User2 {
  String loginId;

  User2({this.loginId = ''});

  bool validateLoginId(String value) {
    if (value.length < 5) {
      return false;
    }
    return true;
  }
}
