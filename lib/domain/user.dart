
class User {
  int id;
  String name;
  int age;
  String job;
  String email;

  User({this.id, this.name, this.age, this.email, this.job});

  //APIに関する変換処理なのでこのロジックの置き場所は要検討
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      email: json['email'],
      job: json['job'],
    );
  }
}
