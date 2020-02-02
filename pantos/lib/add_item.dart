import 'package:flutter/material.dart';

class AddItemWidget extends StatefulWidget {
  @override
  _AddItemWidget createState() => _AddItemWidget();
}

class _AddItemWidget extends State<AddItemWidget> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  registerItem(BuildContext context) {
    Navigator.pop(context, nameController.text);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                    onPressed: () => registerItem(context),
                    child: Text('Register item'))
              ]))
        ])));
  }
}
