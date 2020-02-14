import 'package:flutter_form/src/controller/controller.dart';

class TextController extends FieldController {
  String _value;
  TextController(String field) : super(field) {
    this._value = '';
  }

  @override
  String getValue() {
    return this._value;
  }

  @override
  void Function(dynamic value) getSetValueFunction() {
    return (dynamic value) {
      if (value is String) {
        this._value = value;
      } else {
        throw FormatException('[Flutter-Form] value type must be string');
      }
    };
  }
}
