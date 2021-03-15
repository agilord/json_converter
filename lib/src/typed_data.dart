import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

/// Converts bytes to BASE64-encoded String.
class Uint8ListConverter implements JsonConverter<Uint8List?, String?> {
  final Base64Codec _codec;

  /// Converts bytes to BASE64-encoded String.
  ///
  /// Set [urlSafe] to `true` if the encoded value may end up in an URL.
  const Uint8ListConverter({bool? urlSafe})
      : _codec = (urlSafe ?? false) ? base64Url : base64;

  /// Converts bytes to BASE64-encoded String with the URL-safe encoder.
  const Uint8ListConverter.urlSafe() : _codec = base64Url;

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

/// Converts List of bytes to List of BASE64-encoded Strings.
class Uint8ListListConverter
    implements JsonConverter<List<Uint8List?>?, List<String?>?> {
  final Base64Codec _codec;

  /// Converts List of bytes to List of BASE64-encoded Strings.
  ///
  /// Set [urlSafe] to `true` if the encoded value may end up in an URL.
  const Uint8ListListConverter({bool? urlSafe})
      : _codec = (urlSafe ?? false) ? base64Url : base64;

  /// Converts List of bytes to List of BASE64-encoded Strings with the URL-safe
  /// encoder.
  const Uint8ListListConverter.urlSafe() : _codec = base64Url;

  @override
  List<Uint8List?>? fromJson(List<String?>? json) {
    if (json == null) {
      return null;
    } else {
      return json.map((x) {
        if (x != null) {
          return _codec.decode(x);
        }
        return null;
      }).toList(growable: false);
    }
  }

  @override
  List<String?>? toJson(List<Uint8List?>? list) {
    if (list == null) {
      return null;
    } else {
      return list.map((x) {
        if (x != null) {
          return _codec.encode(x);
        }
        return null;
      }).toList(growable: false);
    }
  }
}
