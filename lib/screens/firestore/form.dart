import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStoreForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Firestore')),
        body: Column(children: [FormBody()]));
  }
}

class FormBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormBodyState();
}

class FormBodyState extends State<FormBody> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _inputController = TextEditingController();

  String title;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
                controller: _inputController,
                decoration: InputDecoration(labelText: 'title'),
                onChanged: (value) => title = value),
            RaisedButton(
                onPressed: () async {
                  CollectionReference messages =
                      Firestore.instance.collection('messages');
                  messages.add(<String, dynamic>{'message': title});

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('registered')));
                },
                child: Text('save')),
          ],
        ));
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
