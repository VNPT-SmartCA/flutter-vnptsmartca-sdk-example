// ignore_for_file: void_checks

import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoService {
  final InternetConnectionChecker connectionChecker;
  final Connectivity connectivity;

  NetworkInfoService(this.connectionChecker, this.connectivity);

  Future<bool> get isConnected async {
    return await connectionChecker.hasConnection;
  }

  Future<ConnectivityResult> getConnectivity() async {
    return await connectivity.checkConnectivity();
  }

  StreamSubscription<ConnectivityResult> onConnectivityChanged(
      void Function(ConnectivityResult event)? onConnectivityChanged) {
    return connectivity.onConnectivityChanged.listen(onConnectivityChanged);
  }

  StreamSubscription<InternetConnectionStatus> onStatusChange(
      void Function(InternetConnectionStatus event)? onStatusChange) {
    return connectionChecker.onStatusChange.listen(onStatusChange);
  }
}
