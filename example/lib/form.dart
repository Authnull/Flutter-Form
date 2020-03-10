import 'package:flutter/material.dart';

import 'package:flutter_form/flutter_form.dart';

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  Map<String, dynamic> _data = {
    "checkbox": false,
    "datePicker": null,
  };
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  allowClear: true,
                  context: context,
                  labelText: "Date Picker",
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
                ),
                Container(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Value: " + (this._data["datePicker"].toString()),
                  ),
                ),
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
    );
  }
}
