import 'package:flutter/material.dart';
import 'package:flutter_form/src/controller/controller.dart';
import 'package:flutter_form/src/schema/text.dart';

class TextController extends FieldController<TextSchema> {
  final _controller = TextEditingController();
  TextController(TextSchema schema) : super(schema as dynamic);

  @override
  String getField() {
    return this.schema.field;
  }

  @override
  String getValue() {
    return this._controller.text;
  }

  @override
  void Function(dynamic value) getSetValueFunction() {
    return (dynamic value) {
      if (value is String) {
        this._controller.text = value;
      } else {
        throw FormatException('[Flutter-Form] value type must be string');
      }
    };
  }

  @override
  TextEditingController getTextEditingController() {
    return this._controller;
  }
}
