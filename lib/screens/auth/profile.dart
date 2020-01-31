import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final FirebaseUser user;

  ProfilePage({Key key, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = widget.user;
    return Scaffold(
        appBar: AppBar(title: Text('Firebase: 認証: プロフィール')),
        body: Column(children: [Text(user.uid), Image.network(user.photoUrl)]));
  }
}
