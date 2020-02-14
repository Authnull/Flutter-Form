import 'package:flutter/material.dart';
import 'package:flutter_form/src/schema//schema.dart';

abstract class FieldController {
  final FormSchema schema;

  FieldController(this.schema);

  String getField();

  dynamic getValue();
  void Function(dynamic value) getSetValueFunction();
  TextEditingController getTextEditingController();
}
