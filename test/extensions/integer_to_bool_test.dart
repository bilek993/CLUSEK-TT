import 'package:clusek_tt/extensions/integer_to_bool.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("'nativeValueToBool' should return true if int is equal to 1", () {
    // Given
    int value = 1;

    // When
    bool convertedValue = value.nativeValueToBool();

    // Then
    expect(convertedValue, true);
  });

  test("'nativeValueToBool' should return false if int is equal to 0", () {
    // Given
    int value = 0;

    // When
    bool convertedValue = value.nativeValueToBool();

    // Then
    expect(convertedValue, false);
  });

  test("'nativeValueToBool' should throw exception for incorrect value", () {
    // Given
    int value = 5;

    // Then
    expect(() => value.nativeValueToBool(), throwsException);
  });
}
