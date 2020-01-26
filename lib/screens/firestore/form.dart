import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form_model.dart';

class FireStoreForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<FormViewModel>(create: (_) => FormViewModel())
    ], child: Column(children: [FormBody()]));
  }
}

class FormBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormBodyState();
}

class FormBodyState extends State<FormBody> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _memoController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Consumer<FormViewModel>(
          builder: (BuildContext context, FormViewModel model, Widget _) {
            return Column(
              children: [
                TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'イベント名'),
                    onChanged: (value) => model.name = value,
                    validator: (value) => model.validateName(value)),
                Row(children: [
                  Expanded(child: Text('日付: ' + model.formattedDate)),
                  IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        showDatePickerPopup(context);
                      })
                ]),
                TextFormField(
                    controller: _urlController,
                    decoration: InputDecoration(labelText: 'URL'),
                    keyboardType: TextInputType.url,
                    onChanged: (value) => model.url = value),
                TextFormField(
                    controller: _memoController,
                    decoration: InputDecoration(labelText: 'メモ'),
                    onChanged: (value) => model.memo = value),
                RaisedButton(
                    onPressed: () {
                      submitForm(model);
                    },
                    child: Text('save')),
              ],
            );
          },
        ));
  }

  void showDatePickerPopup(BuildContext context) async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(DateTime.now().year + 2));

    if (selectedDate != null) {
      var model = Provider.of<FormViewModel>(context, listen: false);
      model.date = selectedDate;
    }
  }

  void submitForm(FormViewModel model) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    model.register();
    clearForm(model);
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('registered')));
  }

  void clearForm(FormViewModel model) {
    _nameController.clear();
    _memoController.clear();
    _urlController.clear();

    model.clear();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
