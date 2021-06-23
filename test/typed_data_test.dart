import 'dart:typed_data';

import 'package:test/test.dart';

import 'package:json_converter/src/typed_data.dart';

void main() {
  test('bytes', () {
    final converter = Uint8ListBase64Converter.urlSafe();

    expect(converter.toJson(Uint8List.fromList(<int>[244, 122, 1])), '9HoB');
    expect(converter.fromJson('9HoB'), [244, 122, 1]);
  });
}
