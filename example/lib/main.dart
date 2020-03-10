import 'package:flutter/material.dart';

import 'package:flutter_form/flutter_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, dynamic> _data;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Form Example'),
        ),
        body: Form(
          child: Column(
            children: <Widget>[
              CheckboxFormField(
                initialValue: false,
                title: Text("Checkbox Form Field"),
                context: context,
                onSaved: (bool value) {
                  if (value) {
                    this._data["checkbox"] = value;
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
