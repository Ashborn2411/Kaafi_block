// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:logger/logger.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:http/http.dart' as http;
// import '../../modules/constants/constants/string_const.dart';
// import '../../modules/validation/formatters/formatter.dart';
// import '../../modules/storage/storage_utility.dart';

// class LocationTimeController {
//   Datetime? datetime = Datetime();
//   bool isDataFetched = false;
//   final Logger logger = Logger();
//   final LocalStorage localStorage = LocalStorage();
//   StreamSubscription<DateTime?>? _timeSubscription;
//   double lat = 0.0;
//   double lon = 0.0;
//   final VoidCallback? onNavigateToDataFetching;
//   final void Function(String title, String message)? onError;

//   LocationTimeController({this.onNavigateToDataFetching, this.onError});

//   void init() {
//     _requestLocationPermissionAndFetchTime();
//   }

//   void onClose() {
//     _timeSubscription?.cancel();
//   }

//   Future<void> _requestLocationPermissionAndFetchTime() async {
//     final permission = await Permission.location.request();
//     if (permission.isGranted) {
//       await _fetchTimeFromAPI();
//     } else {
//       _handleError('Location permission denied');
//     }
//   }

//   Future<void> _fetchTimeFromAPI() async {
//     try {
//       final position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.best,
//       );
//       lat = position.latitude;
//       lon = position.longitude;

//       final url = Uri.parse(
//         "https://timeapi.io/api/Time/current/coordinate?latitude=${position.latitude}&longitude=${position.longitude}",
//       );

//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         datetime = Datetime.fromJson(data);
//         await localStorage.saveData(
//           StringConst.date,
//           Formatter.formatDatetime(datetime!),
//         );
//         isDataFetched = true;
//         if (localStorage.readData(StringConst.fasttimeloggedin) == null) {
//           onNavigateToDataFetching?.call();
//         }
//         _startTimer();
//       } else {
//         _handleError('Failed to get location time');
//       }
//     } catch (e) {
//       _handleError('Error fetching time zone data: $e');
//     }
//   }

//   void _startTimer() {
//     _timeSubscription?.cancel();
//     _timeSubscription =
//         Stream<DateTime?>.periodic(const Duration(seconds: 1), (_) {
//           if (datetime.value != null) {
//             return DateTime(
//               datetime!.year!,
//               datetime!.month!,
//               datetime!.day!,
//               datetime!.hour!,
//               datetime!.minute!,
//               datetime!.seconds!,
//               datetime!.milliSeconds!,
//             ).add(const Duration(seconds: 1));
//           }
//           return null;
//         }).listen((currentDateTime) {
//           if (currentDateTime != null && datetime != null) {
//             datetime!
//               ..year = currentDateTime.year
//               ..month = currentDateTime.month
//               ..day = currentDateTime.day
//               ..hour = currentDateTime.hour
//               ..minute = currentDateTime.minute
//               ..seconds = currentDateTime.second
//               ..milliSeconds = currentDateTime.millisecond
//               ..dateTime = currentDateTime.toIso8601String()
//               ..date =
//                   "${currentDateTime.year}-${currentDateTime.month.toString().padLeft(2, '0')}-${currentDateTime.day.toString().padLeft(2, '0')}"
//               ..time =
//                   "${currentDateTime.hour.toString().padLeft(2, '0')}:${currentDateTime.minute.toString().padLeft(2, '0')}:${currentDateTime.second.toString().padLeft(2, '0')}";
//           }
//         });
//   }

//   void _handleError(String message) {
//     logger.e(message);
//     if (kDebugMode) {
//       print(message);
//     }
//     if (onError != null) {
//       onError!('Error', message);
//     }
//   }
// }
