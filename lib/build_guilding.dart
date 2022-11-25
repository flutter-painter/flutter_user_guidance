import 'package:flutter/material.dart';
import 'package:flutter_user_guidance/sound.dart';
import 'package:flutter_user_guidance/models/guide.dart';

const classicTextStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white);

List<GuideVisualAndSound> buildGuiding(MediaQueryData media) {
  final guidExt = GuideVisualAndSound.rect(
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
    playSound: () => Sound.playSound(),
  );

  final guidExt2 = GuideVisualAndSound.rect(
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
  return <GuideVisualAndSound>[guidExt, guidExt2];
}
