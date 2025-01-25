# safe_edge_insets

EdgeInsets based on SafeArea.

## Installation

```yaml
dependencies:
  safe_edge_insets: ^0.0.2
```

## Properties

```dart
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
```