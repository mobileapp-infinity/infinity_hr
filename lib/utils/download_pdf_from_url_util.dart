import 'dart:convert';
import 'dart:io';


import 'package:dio/dio.dart';
// import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:infinity_hr/utils/CustomHttpException.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class DownloadPdfFromUrlUtils {
  final String? fileUrl;
  String? fileNameWithExtension;
  String? fileExtension;
  final String? menuNameToStoreFileInIt;
  final Dio? _dio = Dio();

  DownloadPdfFromUrlUtils({
    this.fileUrl,
    this.menuNameToStoreFileInIt,
  }) {
    fileNameWithExtension = fileUrl!.split('/').last;
    fileExtension = fileUrl!.substring(fileUrl!.lastIndexOf("."));
  }

  Future<Directory> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return await  getApplicationDocumentsDirectory();
    }
    return await getApplicationDocumentsDirectory();
  }

  Future<void> download() async {
    try {
      final dir = await _getDownloadDirectory();

      final savePath = path.join(dir.path, fileNameWithExtension);
      await _startDownload(fileUrl!, savePath);
    } catch (error) {
      throw CustomHttpException(exceptionMsg: error.toString());
    }
  }

  Future<void> _startDownload(String fileUrl, String savePath) async {
    try {
      final response = await _dio!.download(fileUrl, savePath);
      if (response.statusCode == 200) {
        await openFilefromFilePath(savePath);
      }
    } catch (error) {
      throw CustomHttpException(exceptionMsg: error.toString());
    }
  }

  Future<void> openFilefromFilePath(String filePath) async {
    try {
      await OpenFile.open(filePath);
    } catch (error) {
      throw CustomHttpException(exceptionMsg: error.toString());
    }
  }
}
