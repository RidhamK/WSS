import 'dart:io';

import 'package:flutter/material.dart';

class ViewImage extends StatefulWidget {
  static const routeName = 'imagetab - view_image_page';
  const ViewImage({Key? key}) : super(key: key);

  @override
  _ViewImageState createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.file(File(args)),
      ),
    );
  }
}
