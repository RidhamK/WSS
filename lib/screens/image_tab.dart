import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wsd/screens/view_image.dart';

final Directory _photoDir =
    Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');

class ImageTab extends StatefulWidget {
  const ImageTab({Key? key}) : super(key: key);

  @override
  State<ImageTab> createState() => _ImageTabState();
}

class _ImageTabState extends State<ImageTab> {
  final imageList = _photoDir
      .listSync()
      .map((item) => item.path)
      .where((item) => item.endsWith('.jpg'))
      .toList(growable: false);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: imageList.length,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        child: Card(
          child: Image.file(
            File(imageList[index]),
            fit: BoxFit.cover,
          ),
        ),
        onTap: () => Navigator.of(context)
            .pushNamed(ViewImage.routeName, arguments: imageList[index]),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
