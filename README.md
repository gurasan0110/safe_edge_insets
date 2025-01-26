# safe_edge_insets

EdgeInsets based on SafeArea.

## Installation

```yaml
dependencies:
  safe_edge_insets: ^0.0.4
```

## Usage

SafeEdgeInsets extends EdgeInsets, so it can also be used as an EdgeInsets.

```dart
final SafeEdgeInsets padding = SafeEdgeInsets(
  context,

  /// Whether to avoid system intrusions on the left.
  avoidLeft: true,

  /// Whether to avoid system intrusions at the top of the screen, typically the
  /// system status bar.
  avoidTop: true,

  /// Whether to avoid system intrusions on the right.
  avoidRight: true,

  /// Whether to avoid system intrusions on the bottom side of the screen.
  avoidBottom: true,

  /// This minimum padding to apply.
  ///
  /// The greater of the minimum insets and the media padding will be applied.
  minimum: EdgeInsets.zero,

  /// Specifies whether the [SafeEdgeInsets] should maintain the bottom
  /// [MediaQueryData.viewPadding] instead of the bottom [MediaQueryData.padding].
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// SafeArea, the padding can be maintained below the obstruction rather than
  /// being consumed. This can be helpful in cases where your layout contains
  /// flexible widgets, which could visibly move when opening a software
  /// keyboard due to the change in the padding value. Setting this to true will
  /// avoid the UI shift.
  maintainBottomViewPadding: false,
);
```