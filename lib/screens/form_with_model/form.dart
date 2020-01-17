import 'package:flutter/material.dart';


class FormScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form with model')
      ),
      // あとでChangeNotifierProviderを入れる
      body: FormBody()
    );
  }
}


class FormBody extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => FormBodyState();

}


class FormBodyState extends State<FormBody>
{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Login ID'
          ),
          validator: (String value) {
            //ProviderからViewModelを取得してバリデーションする
          },
          onChanged: (String value) {
            //ProviderからViewModelを取得して通知する
          }
        ),
        RaisedButton(
          onPressed: () {
            //ProviderからViewModelを取得して送信処理を行う
            //結果の受け取りはコールバックを渡す
          },
          child: Text('Submit')
        )
      ]
    );
  }

}
