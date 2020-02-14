import 'package:flutter/material.dart';
import 'package:flutter_form/src/controller/controller.dart';

class SwitchController extends FieldController {
  bool _value;
  SwitchController(String field) : super(field) {
    this._value = false;
  }

  @override
  bool getValue() {
    return this._value;
  }

  @override
  void Function(dynamic value) getSetValueFunction() {
    return (dynamic value) {
      if (value is bool) {
        this._value = value;
      } else {
        throw FormatException('[Flutter-Form] value type must be boolean');
      }
    };
  }

  @override
  TextEditingController getTextEditingController() {
    throw Exception(
        "[Flutter-Form] switch controller doesn't support text editing controller");
  }
}
