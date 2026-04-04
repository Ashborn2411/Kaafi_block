// import 'dart:async';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/services.dart';

// /// Manages the network connectivity status and provides methods to check and handle connectivity changes.
// class NetworkManager {
//   NetworkManager._() {
//     _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
//       _updateConnectionStatus,
//     );
//   }
//   static final NetworkManager instance = NetworkManager._();

//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
//   ConnectivityResult _connectionStatus = ConnectivityResult.none;

//   /// Initialize the network manager and set up a stream to continually check the connection status.
//   /// Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     _connectionStatus = result;
//     if (_connectionStatus == ConnectivityResult.none) {
//       // No context is available here, so network warnings should be handled by the caller.
//     }
//   }

//   /// Check the internet connection status.
//   /// Returns `true` if connected, `false` otherwise.
//   Future<bool> isConnected() async {
//     try {
//       final result = await _connectivity.checkConnectivity();
//       if (result == ConnectivityResult.none) {
//         return false;
//       } else {
//         return true;
//       }
//     } on PlatformException catch (_) {
//       return false;
//     }
//   }

//   /// Dispose or close the active connectivity stream.
//   void dispose() {
//     _connectivitySubscription.cancel();
//   }
// }
