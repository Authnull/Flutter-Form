import 'package:flutter/material.dart';
import 'package:flutter_form_example/form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Example',
      home: FormExample(),
    );
  }
}
