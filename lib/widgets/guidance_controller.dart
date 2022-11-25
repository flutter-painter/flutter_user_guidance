import 'package:flutter/material.dart';

class GuidanceValue {
  const GuidanceValue._([this.visible = false, this.step = 0]);
  const GuidanceValue.initial() : this._();

  const GuidanceValue.custom({bool visible, int step}) : this._(visible, step);

  final bool visible;
  final int step;
}

class GuidanceController extends ValueNotifier<GuidanceValue> {
  GuidanceController() : super(GuidanceValue.initial());

  void show({int from = 0}) {
    value = GuidanceValue.custom(
      visible: true,
      step: from,
    );
  }

  void next() {
    value = GuidanceValue.custom(
      visible: value.visible,
      step: value.step + 1,
    );
  }

  void hide() {
    value = GuidanceValue.custom(
      visible: false,
      step: value.step,
    );
  }
}
