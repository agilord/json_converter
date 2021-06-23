import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

/// Converts bytes to BASE64-encoded String.
class Uint8ListBase64Converter implements JsonConverter<Uint8List, String> {
  final Base64Codec _codec;

  /// Converts bytes to BASE64-encoded String.
  const Uint8ListBase64Converter() : _codec = base64;

  /// Converts bytes to BASE64-encoded String with the URL-safe encoder.
  const Uint8ListBase64Converter.urlSafe() : _codec = base64Url;

  @override
  Uint8List fromJson(String json) => _codec.decode(json);

  @override
  String toJson(Uint8List object) => _codec.encode(object);
}

/// Converts bytes to BASE64-encoded String (nullable values).
class NullableUint8ListBase64Converter
    implements JsonConverter<Uint8List?, String?> {
  final Base64Codec _codec;

  /// Converts bytes to BASE64-encoded String.
  const NullableUint8ListBase64Converter() : _codec = base64;

  /// Converts bytes to BASE64-encoded String with the URL-safe encoder.
  const NullableUint8ListBase64Converter.urlSafe() : _codec = base64Url;

  @override
  Uint8List? fromJson(String? json) {
    if (json != null) {
      return _codec.decode(json);
    }
    return null;
  }

  @override
  String? toJson(Uint8List? object) {
    if (object != null) {
      return _codec.encode(object);
    }
    return null;
  }
}
