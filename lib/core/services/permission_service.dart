import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> requestMediaPermissions() async {
    // Check and request permissions for Android
    if (Platform.isAndroid) {
      PermissionStatus photoStatus = await Permission.photos.status;
      PermissionStatus storageStatus = await Permission.storage.status;

      if (photoStatus.isDenied || storageStatus.isDenied) {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.photos,
          Permission.storage,
        ].request();

        return statuses[Permission.photos]!.isGranted &&
            statuses[Permission.storage]!.isGranted;
      }

      // permanantly denied
      if (photoStatus.isPermanentlyDenied ||
          storageStatus.isPermanentlyDenied) {
        await openAppSettings();
        return false;
      }

      return photoStatus.isGranted && storageStatus.isGranted;
    }

    // Check and request permissions for iOS
    if (Platform.isIOS) {
      PermissionStatus photoStatus = await Permission.photos.status;

      if (photoStatus.isDenied) {
        PermissionStatus status = await Permission.photos.request();
        return status.isGranted;
      }

      if (photoStatus.isPermanentlyDenied) {
        await openAppSettings();
        return false;
      }

      return photoStatus.isGranted;
    }

    return false;
  }

  Future<bool> requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.status;

    if (status.isDenied) {
      status = await Permission.notification.request();
      return status.isGranted;
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    return status.isGranted;
  }
}
