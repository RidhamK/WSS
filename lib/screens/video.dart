import 'dart:typed_data';

import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);
  static const routeName = 'tab to play ';

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Uint8List;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 25, bottom: 25, left: 10, right: 10),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.memory(
              args,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
