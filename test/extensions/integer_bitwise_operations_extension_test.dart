import 'package:clusek_tt/extensions/integer_bitwise_operations_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("'checkFlag' should return true if flag is set", () {
    // Given
    int flag = 0x8;

    // When
    int mask = 0x59;
    bool isFlagSet = mask.checkFlag(flag);

    // Then
    expect(isFlagSet, true);
  });

  test("'checkFlag' should return false if flag is not set", () {
    // Given
    int flag = 0x8;

    // When
    int mask = 0x51;
    bool isFlagSet = mask.checkFlag(flag);

    // Then
    expect(isFlagSet, false);
  });

  test("'addFlag' should set one flag", () {
    // Given
    int flag = 0x8;

    // When
    int mask = 0x0;
    mask = mask.addFlag(flag);

    // Then
    expect(mask, 0x8);
  });

  test("'addFlag' should set multiple flags", () {
    // Given
    int flagA = 0x1;
    int flagB = 0x2;
    int flagC = 0x4;
    int flagD = 0x8;

    // When
    int mask = 0x0;
    mask = mask.addFlag(flagA);
    mask = mask.addFlag(flagB);
    mask = mask.addFlag(flagC);
    mask = mask.addFlag(flagD);

    // Then
    expect(mask, 0xF);
  });

  test("'removeFlag' should remove only flag on the mask and leave it as empty",
      () {
    // Given
    int flag = 0x8;

    // When
    int mask = 0x8;
    mask = mask.removeFlag(flag);

    // Then
    expect(mask, 0x0);
  });

  test(
      "'removeFlag' should remove multiple flags on the mask and leave it as empty",
      () {
    // Given
    int flagA = 0x1;
    int flagB = 0x2;
    int flagC = 0x4;
    int flagD = 0x8;

    // When
    int mask = 0xF;
    mask = mask.removeFlag(flagA);
    mask = mask.removeFlag(flagB);
    mask = mask.removeFlag(flagC);
    mask = mask.removeFlag(flagD);

    // Then
    expect(mask, 0x0);
  });

  test("'removeFlag' should remove multiple flags, but leave some", () {
    // Given
    int flagA = 0x2;
    int flagB = 0x40;

    // When
    int mask = 0x153;
    mask = mask.removeFlag(flagA);
    mask = mask.removeFlag(flagB);

    // Then
    expect(mask, 0x111);
  });

  test("'flipFlag' double calling should cause returning to initial state", () {
    // Given
    int flag = 0x4;

    // When
    int mask = 0x2;
    mask = mask.flipFlag(flag);
    mask = mask.flipFlag(flag);

    // Then
    expect(mask, 0x2);
  });

  test("'flipFlag' should properly remove flag", () {
    // Given
    int flag = 0x4;

    // When
    int mask = 0x14;
    mask = mask.flipFlag(flag);

    // Then
    expect(mask, 0x10);
  });

  test("'flipFlag' should properly add flag", () {
    // Given
    int flag = 0x4;

    // When
    int mask = 0x10;
    mask = mask.flipFlag(flag);

    // Then
    expect(mask, 0x14);
  });

  test("'clearAllFlags' should reset mask by setting it to 0x0", () {
    // Given

    // When
    int mask = 0x84;
    mask = mask.clearAllFlags();

    // Then
    expect(mask, 0x0);
  });
}
