import 'package:flutter/material.dart';
import 'package:flutter_form/src/controller/controller.dart';

class TextController extends FieldController {
  final _controller = TextEditingController();
  TextController(String field) : super(field);

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
