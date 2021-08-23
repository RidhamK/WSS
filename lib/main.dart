import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wsd/screens/home.dart';
import 'package:wsd/screens/test.dart';
import 'package:wsd/screens/video.dart';
import 'package:wsd/screens/view_image.dart';

import 'models/permission.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('${Permission.storage.status}   my app');
    return MaterialApp(
      title: 'WSD',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const CustomPermission(),
      routes: {
        ViewImage.routeName: (ctx) => const ViewImage(),
        VideoPlayer.routeName: (ctx) => const VideoPlayer(),
      },
    );
  }
}
