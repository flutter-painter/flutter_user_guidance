import 'package:flutter/material.dart';

class GuideVisual {
  final Rect rect;
  final Decoration decoration;
  final Widget widget;
  const GuideVisual._(this.rect, this.decoration, this.widget);

  /// Create a custom [Guide2] instance.
  /// NOTICE: To take effect set any color e.g. [Colors.white].
  const GuideVisual.custom(Rect rect, Widget widget, {Decoration decoration})
      : this._(rect, decoration, widget);

  const GuideVisual.rect(Rect rect, Widget widget)
      : this._(
            rect,
            const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            widget);

  const GuideVisual.circle(Rect rect, Widget widget)
      : this._(
            rect,
            const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            widget);
}
