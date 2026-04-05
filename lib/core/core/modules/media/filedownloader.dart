import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<String> downloadFile(String url, String fileName) async {
  try {
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      throw Exception('Storage permission denied');
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String? path = await FilePicker.platform.saveFile(
        dialogTitle: 'Please select an output file:',
        fileName: fileName,
      );

      if (path == null) {
        throw Exception('File save canceled by user');
      }

      final file = File(path);

      await file.writeAsBytes(response.bodyBytes);
      debugPrint('File downloaded successfully: $path');
      return path;
    } else {
      throw Exception('Failed to download file: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('Error downloading file: $e');
    throw Exception('Failed to download file: $e');
  }
}
