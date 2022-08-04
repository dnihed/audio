import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  XylophoneApp({Key? key}) : super(key: key);
  AudioPlayer? soundPlayer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: TextButton(
              child: const Text('click me pleaaaseee'),
              onPressed: () async {
                soundPlayer ??= AudioPlayer();
                if (soundPlayer!.playing) {
                  await soundPlayer!.stop();
                }

                soundPlayer!.setUrl('https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3').then((_) => soundPlayer!.play());
              },
            ),
          ),
        ),
      ),
    );
  }
}
