import 'dart:collection';

import 'package:flutter_form/src/controller/controller.dart';

class Form {
  final List<FieldController> controllers;

  Form(this.controllers);

  Map<String, dynamic> summarize() {
    final Map<String, dynamic> result = new LinkedHashMap();
    for (FieldController controller in this.controllers) {
      result[controller.field] = controller.getValue();
    }

    return result;
  }
}
