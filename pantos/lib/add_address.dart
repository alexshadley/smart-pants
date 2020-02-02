import 'package:flutter/material.dart';
import 'package:pantos/geocode.dart';

class AddAddressWidget extends StatefulWidget {
  @override
  _AddAddressWidget createState() => _AddAddressWidget();
}

class _AddAddressWidget extends State<AddAddressWidget> {
  final _formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  final nameController = TextEditingController();

  Future<Coordinate> submitAddress() {
    print('address submitted: ${addressController.text}');
    return geocode(addressController.text);
  }

  @override
  void dispose() {
    addressController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Location"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                      controller: addressController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Address is required';
                        }
                        return null;
                      },
                    ),
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
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                          submitAddress().then((Coordinate c) {
                            Navigator.pop(context, c);
                          });
                        }
                      },
                      child: Text('Submit'),
                    )
                  ]))
            ],
          ),
        ));
  }
}
