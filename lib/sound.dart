import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

// TO be continued
final List<AudioSource> audioSource = [
  AudioSource.uri(Uri(
    scheme: 'asset',
    path: 'assets/congratulations.mp3',
  )),
];

class Sound {
  static playSound() {
    final _player = AudioPlayer();
    _player
        .setAsset('assets/congratulations.mp3')
        .then((_) => _player.play().then((_) => _player.dispose()));
  }
}
