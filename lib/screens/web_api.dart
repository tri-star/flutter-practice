import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_practice/domain/user.dart';

class WebApi extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web API')
      ),
      body: UserDetail()
    );
  }
}


class UserDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserDetailState();
}

class UserDetailState extends State<UserDetail> {

  Future<User> user;

  @override
  void initState() {
    super.initState();

    user = this.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: user,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return Column(
            children: [
              Text('id: ${snapshot.data.id}'),
              Text('name: ${snapshot.data.name}'),
              Text('job: ${snapshot.data.job}'),
              Text('age: ${snapshot.data.age}'),
            ]
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      }
    );
  }

  Future<User> fetchUser() async {
    await Future.delayed(Duration(seconds: 1));
    http.Response response = await http.get('http://10.0.2.2:3000/user/1');

    if(response.statusCode != 200) {
      throw new Exception('ユーザー情報の取得に失敗しました。');
    }
    User user = User.fromJson(jsonDecode(response.body));
    return user;
  }
}
