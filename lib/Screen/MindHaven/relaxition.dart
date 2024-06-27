import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Player Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  bool isPlaying = false;
  String localFilePath =
      "assets/audio/audio.mp3"; // Adjust this to your audio file path

  @override
  void initState() {
    super.initState();
    advancedPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      }
    });
  }

  // void _playAudio() async {
  //   advancedPlayer = await audioCache.play(localFilePath);
  // }

  // ignore: unused_element
  void _pauseAudio() {
    advancedPlayer.pause();
  }

  @override
  void dispose() {
    advancedPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Audio Player Demo',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            // IconButton(
            //   icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            //   iconSize: 48.0,
            //   onPressed: () {
            //     if (isPlaying) {
            //       _pauseAudio();
            //     } else {
            //       _playAudio();
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
