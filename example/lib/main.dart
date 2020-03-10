import 'package:flutter/material.dart';

import 'package:flutter_form/flutter_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic> _data = {
    "checkbox": false,
    "datePicker": null,
  };
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Form Example'),
        ),
        body: Column(
          children: <Widget>[
            Form(
              key: this._formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CheckboxFormField(
                    initialValue: false,
                    title: Text("Checkbox Form Field"),
                    context: context,
                    onSaved: (bool value) {
                      this._data["checkbox"] = value;
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Value: " + (this._data["checkbox"] ? "true" : "false"),
                    ),
                  ),
                  DatePickerFormField(
                    context: context,
                    initialValue: DateTime.now(),
                    validator: (DateTime dateTime) {
                      if (dateTime == null) {
                        return "Date Time Required";
                      }
                      return null;
                    },
                    onSaved: (DateTime dateTime) {
                      print(dateTime);
                      this._data["datePicker"] = dateTime;
                    },
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text("Save"),
              onPressed: () {
                if (this._formKey.currentState.validate()) {
                  this._formKey.currentState.save();
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
