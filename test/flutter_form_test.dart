import 'package:flutter_form/flutter_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('create field', () {
    final TextSchema schema = TextSchema('example');
    final TextController text = TextController(schema);
    expect(text.getField(), 'example');
  });
}
