import 'package:flutter/material.dart';
import 'package:wsd/screens/image_tab.dart';
import 'package:wsd/screens/videos_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Stories'),
            bottom: const TabBar(tabs: [
              Tab(text: 'Images'),
              Tab(text: 'Videos'),
            ]),
          ),
          body: const TabBarView(children: [
            ImageTab(),
            Videostab(),
          ]),
        ),
      ),
    );
  }
}
