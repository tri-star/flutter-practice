import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'profile.dart';

class AuthIndex extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AuthIndexState();
}

class AuthIndexState extends State<AuthIndex> {
  final GoogleSignIn _signin = GoogleSignIn(scopes: ['profile']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Firebase auth')),
        body: Builder(
          builder: (BuildContext context) {
            return Column(children: [
              RaisedButton(
                  onPressed: () => {_onLoginClick(context)},
                  child: Text('Login'))
            ]);
          },
        ));
  }

  void _onLoginClick(BuildContext context) async {
    final User user = await _handleSignin();
    if (user == null) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Login failed.')));
      return;
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ProfilePage(user: user);
    }));
  }

  Future<User> _handleSignin() async {
    GoogleSignInAccount currentUser = _signin.currentUser;

    try {
      if (currentUser == null) {
        currentUser = await _signin.signInSilently();
      }
      if (currentUser == null) {
        currentUser = await _signin.signIn();
      }
      if (currentUser == null) {
        return null;
      }

      GoogleSignInAuthentication googleAuth = await currentUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final User firebaseUser =
          (await _auth.signInWithCredential(credential)).user;

      return firebaseUser;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
