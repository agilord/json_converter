import 'dart:typed_data';

import 'package:test/test.dart';

import 'package:json_converter/src/typed_data.dart';

void main() {
  test('bytes', () {
    final converter = Uint8ListConverter(urlSafe: true);

    expect(converter.toJson(Uint8List.fromList(<int>[244, 122, 1])), '9HoB');
    expect(converter.fromJson('9HoB'), [244, 122, 1]);
  });

  test('list of bytes', () {
    final converter = Uint8ListListConverter(urlSafe: true);

    expect(
        converter.toJson([
          Uint8List.fromList(<int>[244, 122, 1]),
          Uint8List.fromList(<int>[1, 0, 1]),
        ]),
        [
          '9HoB',
          'AQAB',
        ]);
    expect(
        converter.fromJson([
          '9HoB',
          'AQAB',
        ]),
        [
          [244, 122, 1],
          [1, 0, 1],
        ]);
  });
}
