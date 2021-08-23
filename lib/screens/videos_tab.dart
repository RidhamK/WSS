import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:wsd/screens/video.dart';

final Directory _photoDir =
    Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');

class Videostab extends StatefulWidget {
  const Videostab({Key? key}) : super(key: key);

  @override
  _VideostabState createState() => _VideostabState();
}

class _VideostabState extends State<Videostab> {
  Future<Uint8List> call(String path) async {
    final uint8listt = await VideoThumbnail.thumbnailData(
      video: path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 128,
      quality: 25,
    );
    // final Uint8List bytes = Uint8List.fromList(uint8listt!);
    // final codec = await instantiateImageCodec(bytes);
    // final frameInfo = await codec.getNextFrame();
    // return frameInfo.image;
    return uint8listt!;
  }

  @override
  Widget build(BuildContext context) {
    final imageList = _photoDir
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith('.mp4'))
        .toList(growable: false);

    return GridView.builder(
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return FutureBuilder<Uint8List>(
          future: call(imageList[index]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return GestureDetector(
                  child: Card(
                    child: Image.memory(
                      snapshot.data!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () => Navigator.of(context).pushNamed(
                      VideoPlayer.routeName,
                      arguments: snapshot.data),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          },
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
