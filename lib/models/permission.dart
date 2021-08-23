import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wsd/screens/home.dart';

class CustomPermission extends StatefulWidget {
  const CustomPermission({Key? key}) : super(key: key);

  @override
  State<CustomPermission> createState() => _CustomPermissionState();
}

class _CustomPermissionState extends State<CustomPermission> {
  final Permission _permission = Permission.storage;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    _listenForPermissionStatus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      _permissionStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _permissionStatus == PermissionStatus.granted
        ? const HomeScreen()
        : Scaffold(
            appBar: AppBar(),
            body: Center(
              child: ElevatedButton(
                onPressed: () => requestPermission(_permission),
                child: const Text('Next'),
              ),
            ),
          );
  }
}
