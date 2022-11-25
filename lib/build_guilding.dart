import 'package:flutter/material.dart';
import 'package:flutter_user_guidance/models/guide.dart';

const classicTextStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white);

List<GuideVisual> buildGuiding(MediaQueryData media) {
  final guidExt = GuideVisual.rect(
    Rect.fromLTWH(
      0.0,
      0.0,
      media.size.width,
      media.viewPadding.top,
    ),
    Container(
      margin: EdgeInsets.only(top: 120),
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      alignment: Alignment.topCenter,
      child: const Text(
        'Let me be your guide...',
        style: classicTextStyle,
      ),
    ),
  );

  final guidExt2 = GuideVisual.rect(
      Rect.fromLTWH(
        0.0,
        media.viewPadding.top,
        media.size.width,
        56.0,
      ),
      Container(
        margin: EdgeInsets.only(top: 120),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        alignment: Alignment.topCenter,
        child: const Text(
          'System StatusBar',
          style: classicTextStyle,
        ),
      ));
  return <GuideVisual>[guidExt, guidExt2];
}
