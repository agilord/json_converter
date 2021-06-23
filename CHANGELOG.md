## 2.0.0

**BREAKING CHANGES**:
- `Uint8ListConverter` is non-nullable (use `NullableUint8ListConverter` for nullable fields).
- removed `Uint8ListListConverter` (class-level annotation should work instead)
- removed `urlSafe` constructor parameter, use `.urlSafe` constructors if needed.

## 1.1.0

- Migrated to null safety.

## 1.0.2

- **Minor breaking change**: Fix typo in API.

## 1.0.1

- Separate URL-safe constructor for frameworks that doesn't accept parameters in annotations.

## 1.0.0

- Initial release: `Uint8List` converters.

