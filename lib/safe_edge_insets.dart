import 'dart:math';

import 'package:flutter/widgets.dart';

/// [EdgeInsets] based on SafeArea.
class SafeEdgeInsets extends EdgeInsets {
  const SafeEdgeInsets._({
    required this.avoidLeft,
    required this.avoidTop,
    required this.avoidRight,
    required this.avoidBottom,
    required this.minimum,
    required this.maintainBottomViewPadding,
    required super.left,
    required super.top,
    required super.right,
    required super.bottom,
  }) : super.only();

  /// Whether to avoid system intrusions on the left.
  final bool avoidLeft;

  /// Whether to avoid system intrusions at the top of the screen, typically the
  /// system status bar.
  final bool avoidTop;

  /// Whether to avoid system intrusions on the right.
  final bool avoidRight;

  /// Whether to avoid system intrusions on the bottom side of the screen.
  final bool avoidBottom;

  /// This minimum padding to apply.
  ///
  /// The greater of the minimum insets and the media padding will be applied.
  final EdgeInsets minimum;

  /// Specifies whether the [SafeEdgeInsets] should maintain the bottom
  /// [MediaQueryData.viewPadding] instead of the bottom [MediaQueryData.padding].
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// SafeArea, the padding can be maintained below the obstruction rather than
  /// being consumed. This can be helpful in cases where your layout contains
  /// flexible widgets, which could visibly move when opening a software
  /// keyboard due to the change in the padding value. Setting this to true will
  /// avoid the UI shift.
  final bool maintainBottomViewPadding;

  /// [EdgeInsets] based on SafeArea.
  ///
  /// [avoidLeft] : Whether to avoid system intrusions on the left.
  ///
  /// [avoidTop] : Whether to avoid system intrusions at the top of the screen, typically the
  /// system status bar.
  ///
  /// [avoidRight] : Whether to avoid system intrusions on the right.
  ///
  /// [avoidBottom] : Whether to avoid system intrusions on the bottom side of the screen.
  ///
  /// [minimum] : This minimum padding to apply.
  ///
  /// The greater of the minimum insets and the media padding will be applied.
  ///
  /// [maintainBottomViewPadding] : Specifies whether the [SafeEdgeInsets] should maintain the bottom
  /// [MediaQueryData.viewPadding] instead of the bottom [MediaQueryData.padding].
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// SafeArea, the padding can be maintained below the obstruction rather than
  /// being consumed. This can be helpful in cases where your layout contains
  /// flexible widgets, which could visibly move when opening a software
  /// keyboard due to the change in the padding value. Setting this to true will
  /// avoid the UI shift.
  factory SafeEdgeInsets(
    BuildContext context, {
    bool avoidLeft = true,
    bool avoidTop = true,
    bool avoidRight = true,
    bool avoidBottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) {
    EdgeInsets padding = MediaQuery.paddingOf(context);

    if (maintainBottomViewPadding) {
      final viewPaddingBottom = MediaQuery.viewPaddingOf(context).bottom;
      padding = padding.copyWith(bottom: viewPaddingBottom);
    }

    return SafeEdgeInsets._(
      avoidLeft: avoidLeft,
      avoidTop: avoidTop,
      avoidRight: avoidRight,
      avoidBottom: avoidBottom,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
      left: max(avoidLeft ? padding.left : 0, minimum.left),
      top: max(avoidTop ? padding.top : 0, minimum.top),
      right: max(avoidRight ? padding.right : 0, minimum.right),
      bottom: max(avoidBottom ? padding.bottom : 0, minimum.bottom),
    );
  }
}
