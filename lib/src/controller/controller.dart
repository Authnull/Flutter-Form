abstract class FieldController {
  final String field;

  FieldController(this.field);

  dynamic getValue();
  void Function(dynamic value) getSetValueFunction();
}
