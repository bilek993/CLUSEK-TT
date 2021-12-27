import 'package:clusek_tt/extensions/animation_controller_easing_extension.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'animation_controller_easing_extension_test.mocks.dart';

@GenerateMocks([AnimationController])
void main() {
  const double epsilon = 0.01;

  test("'easeOutQuartValue' should return around 1.0 for 1.0", () {
    // Given
    AnimationController animationControllerMock = MockAnimationController();

    // When
    when(animationControllerMock.value).thenReturn(1.0);
    double easeValue = animationControllerMock.easeOutQuartValue;

    // Then
    expect(easeValue, closeTo(1.0, epsilon));
  });

  test("'easeOutQuartValue' should return around 0.0 for 0.0", () {
    // Given
    AnimationController animationControllerMock = MockAnimationController();

    // When
    when(animationControllerMock.value).thenReturn(0.0);
    double easeValue = animationControllerMock.easeOutQuartValue;

    // Then
    expect(easeValue, closeTo(0.0, epsilon));
  });

  test("'easeOutQuartValue' should return around 0.93 for 0.5", () {
    // Given
    AnimationController animationControllerMock = MockAnimationController();

    // When
    when(animationControllerMock.value).thenReturn(0.5);
    double easeValue = animationControllerMock.easeOutQuartValue;

    // Then
    expect(easeValue, closeTo(0.93, epsilon));
  });
}
