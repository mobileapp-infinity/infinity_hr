import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'CustomHttpException.dart';

class PermissionUtil {
  static Future<bool> checkPermission(TargetPlatform platform) async {
    if (platform == TargetPlatform.android) {
      bool isAllPermissionGranted = await _requestPermission();
      if (!isAllPermissionGranted) {
        isAllPermissionGranted = await _requestPermission();
        if (isAllPermissionGranted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  static Future<bool> _requestPermission() async {
    Map<Permission, PermissionStatus> permissionStatusesMap = await [
      Permission.storage,
    ].request();

    bool isAllPermissionGranted = true;

    List<PermissionStatus> permissionStatusList =
        permissionStatusesMap.values.toList();
    for (int i = 0; i < permissionStatusList.length; i++) {
      if (!permissionStatusList[i].isGranted) {
        isAllPermissionGranted = false;
      }
    }
    return isAllPermissionGranted;
  }

  static void openFileFromBase64String(
      String base64String, String fileName) async {
    Uint8List bytes = base64.decode(base64String);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/${fileName}.pdf');
    File fileNew = await file.writeAsBytes(bytes);
    String filePath = fileNew.path;
    try {
      await OpenFile.open(filePath);
    } catch (error) {
      throw CustomHttpException(exceptionMsg: error.toString());
    }
  }
}
