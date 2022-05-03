import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class TurboPermissionHandler {
  const TurboPermissionHandler._();

  static Future<PermissionStatus> checkLocationPermission() async {
    return await Permission.location.status;
  }

  static Future<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      await Permission.location.request();
      return false;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }
    return false;
  }
}
