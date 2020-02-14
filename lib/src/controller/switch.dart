import 'package:flutter/material.dart';
import 'package:flutter_form/src/controller/controller.dart';
import 'package:flutter_form/src/schema/switch.dart';

class SwitchController extends FieldController<SwitchSchema> {
  bool _value;
  SwitchController(SwitchSchema schema) : super(schema) {
    this._value = false;
  }

  @override
  String getField() {
    return this.schema.field;
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
