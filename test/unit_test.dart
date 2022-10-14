import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/for_test/test.dart';

void main() {
  test('First test', () {
    final counter = Testing();

    counter.increase();
    expect(counter.number, 1);
  });
}
