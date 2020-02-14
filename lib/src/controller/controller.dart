import 'package:flutter/material.dart';
import 'package:flutter_form/flutter_form.dart';

abstract class FieldController<T extends FormSchema> {
  T schema;

  FieldController(this.schema);

  String getField();

  dynamic getValue();
  void Function(dynamic value) getSetValueFunction();
  TextEditingController getTextEditingController();
}
