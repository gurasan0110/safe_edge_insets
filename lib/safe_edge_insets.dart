import 'dart:math';

import 'package:flutter/widgets.dart';

class SafeEdgeInsets extends EdgeInsets {
  const SafeEdgeInsets._({
    super.left,
    super.top,
    super.right,
    super.bottom,
  }) : super.only();

  /// [EdgeInsets] based on SafeArea
  ///
  /// [left] (default: true) Whether to avoid system intrusions on the left.
  ///
  /// [top] (default: true) Whether to avoid system intrusions at the top of the screen, typically the
  /// system status bar.
  ///
  /// [right] (default: true) Whether to avoid system intrusions on the right.
  ///
  /// [bottom] (default: true) Whether to avoid system intrusions on the bottom side of the screen.
  ///
  /// [minimum] (default: [EdgeInsets.zero]) This minimum padding to apply.
  ///
  /// The greater of the minimum insets and the media padding will be applied.
  ///
  /// [maintainBottomViewPadding] (default: false) Specifies whether the [SafeEdgeInsets] should maintain the bottom
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
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) {
    EdgeInsets padding = MediaQuery.paddingOf(context);

    if (maintainBottomViewPadding) {
      final viewPaddingBottom = MediaQuery.viewPaddingOf(context).bottom;
      padding = padding.copyWith(bottom: viewPaddingBottom);
    }

    return SafeEdgeInsets._(
      left: max(left ? padding.left : 0, minimum.left),
      top: max(top ? padding.top : 0, minimum.top),
      right: max(right ? padding.right : 0, minimum.right),
      bottom: max(bottom ? padding.bottom : 0, minimum.bottom),
    );
  }
}
