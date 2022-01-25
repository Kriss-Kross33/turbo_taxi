import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class TurboPermissionHandler {
  const TurboPermissionHandler._();

  static Future<void> requestLocationPermission() async {
    var status = await Permission.location.status;
    // if (await Permission.location.request().isGranted) {
    //   debugPrint('PERMISSION GRANTED');
    // }
    if (status.isDenied) {
      debugPrint('PERMISSION DENIED');
      await Permission.location.request();
    }
  }
}
