import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/screens/form_with_model/form_view_model.dart';
import 'package:provider/provider.dart';

// ChangeNotifierはViewModel的な部分はあるものの、
// 変更を伝搬させたい最小の範囲を対象に定義しないと無駄な再描画を起こしてしまう。

class FormWithModelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Form with model')),
        body: MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => FormViewModel())
        ], child: Column(children: [FormBody(), UserListSection()])));
  }
}

class FormBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormBodyState();
}

class FormBodyState extends State<FormBody> {
  final _formKey = GlobalKey<FormState>();
  final _loginIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Consumer<FormViewModel>(
            builder: (BuildContext c, FormViewModel model, Widget child) {
          return Column(children: [
            TextFormField(
                controller: _loginIdController,
                decoration: InputDecoration(labelText: 'Login ID'),
                keyboardType: TextInputType.text,
                validator: (String value) => model.validateLoginId(value),
                onChanged: (String value) => model.setLoginId(value)),
            RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _loginIdController.clear();
                    model.register();
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('LoginID: ${model.getLoginId()}')));
                  }
                },
                child: Text('Submit'))
          ]);
        }));
  }

  @override
  void dispose() {
    _loginIdController.dispose();
    super.dispose();
  }
}

class UserListSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormViewModel>(
      builder: (BuildContext context, FormViewModel model, Widget child) {
        return Expanded(
            child: ListView.separated(
          itemCount: model.getUserList().length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text(model.getUserList()[index].loginId));
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.red,
            thickness: 1,
          ),
        ));
      },
    );
  }
}
