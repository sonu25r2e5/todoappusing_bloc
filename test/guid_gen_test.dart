import 'package:bloc_apps/services/guid_gen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GUIDGen', () {
    test('generates a UUID-like id', () {
      final first = GUIDGen.generate();
      final second = GUIDGen.generate();

      expect(first, isNotEmpty);
      expect(second, isNotEmpty);
      expect(first, isNot(equals(second)));
      expect(first, matches(RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$')));
    });
  });
}
