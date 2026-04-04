import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import '../../../../logging/logger/app_logger.dart';

class FirebaseService {
  static Future<void> initializeFirebase() async {
    try {
      await Firebase.initializeApp();
      AppLogger.i('Firebase initialized.');

      await _initializeAppCheck();
      await _initializeMessaging();
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Firebase initialization failed: ${e.message}");
      }
      rethrow;
    }
  }

  static Future<void> _initializeAppCheck() async {
    try {
      if (kIsWeb) {
        // Replace the placeholder value below with your Firebase reCAPTCHA site key
        // from Firebase Console > App Check > reCAPTCHA v3. Without a valid key, web AppCheck
        // may throw appCheck/recaptcha-error.
        const webAppCheckKey = '6LfIzZcsAAAAAIMiodzqpL49uo6MFnWjet019HFK';

        await FirebaseAppCheck.instance.activate(
          webProvider: ReCaptchaV3Provider(webAppCheckKey),
        );
        AppLogger.i('Firebase AppCheck (web) activated.');
      } else {
        await FirebaseAppCheck.instance.activate(
          androidProvider: AndroidProvider.debug,
          appleProvider: AppleProvider.appAttest,
        );
        AppLogger.i('Firebase AppCheck (mobile) activated.');
      }
    } catch (e, s) {
      AppLogger.e(
        'Firebase AppCheck activation failed',
        error: e,
        stackTrace: s,
      );
      if (kDebugMode) {
        print('AppCheck activation failed: $e');
      }
    }
  }

  static Future<void> _initializeMessaging() async {
    try {
      // Add messaging token for analytics in both mobile/web
      final token = await FirebaseMessaging.instance.getToken();
      if (kDebugMode) print('FCM token: $token');

      // Initialize Firebase Messaging
      AppLogger.i('Firebase Messaging initialized.');
    } catch (e, s) {
      AppLogger.e(
        'Firebase Messaging initialization failed',
        error: e,
        stackTrace: s,
      );
    }
  }

  static Future<String?> getMessagingToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      AppLogger.e('Failed to get FCM token', error: e);
      return null;
    }
  }
}
