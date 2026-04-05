import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class AppLogger {
  AppLogger._();

  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 100,
      colors: !kIsWeb,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static Future<void> init() async {
    logger.i('AppLogger initialized.');

    if (!kIsWeb) {
      try {
        final dir = await getApplicationDocumentsDirectory();
        final file = File('${dir.path}/app_log.txt');
        if (!await file.exists()) {
          await file.create(recursive: true);
        }
        logger.i('Log file path: ${file.path}');
      } catch (e) {
        logger.w('Could not initialize persistent log file: $e');
      }
    }
  }

  static Future<void> appendToFile(String message) async {
    if (kIsWeb) return;
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/app_log.txt');
      await file.writeAsString(
        '${DateTime.now().toIso8601String()} $message\n',
        mode: FileMode.append,
      );
    } catch (e) {
      logger.w('Failed writing log to file: $e');
    }
  }

  static void d(String message) {
    logger.d(message);
    appendToFile('DEBUG: $message');
  }

  static void i(String message) {
    logger.i(message);
    appendToFile('INFO: $message');
  }

  static void w(String message) {
    logger.w(message);
    appendToFile('WARN: $message');
  }

  static void e(String message, {dynamic error, StackTrace? stackTrace}) {
    logger.e(message, error: error, stackTrace: stackTrace);
    appendToFile('ERROR: $message ${error ?? ''}');
  }
}
