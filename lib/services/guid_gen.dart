import 'dart:math';

class GUIDGen {
  GUIDGen._();

  static String generate() {
    final random = Random();
    final values = List<int>.generate(16, (_) => random.nextInt(256));

    values[6] = (values[6] & 0x0f) | 0x40;
    values[8] = (values[8] & 0x3f) | 0x80;

    final hex = values.map((value) => value.toRadixString(16).padLeft(2, '0')).join();

    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20)}';
  }
}
