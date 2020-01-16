import 'package:flutter/material.dart';


class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form')),
      body: UserRegistForm(),
    );
  }
}

class UserRegistForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserRegistFormState();
}


class UserRegistFormState extends State<UserRegistForm> {

  final _formKey = GlobalKey<FormState>();

  String _text;

  @override
  void initState()
  {
    super.initState();
    this._text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Login ID',
            ),
            onChanged: (String value) => _text = value,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Login ID: ' + _text)
                ));
              },
            ),
          )
        ]
      )
    );
  }
}
