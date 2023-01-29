import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_connectivity.g.dart';

@riverpod
Future<bool> isNetworkConnected(IsNetworkConnectedRef ref) async {
  final result = await Connectivity().checkConnectivity();
  return result != ConnectivityResult.none;
}

final _networkConnectivityStream =
    StreamProvider((_) => Connectivity().onConnectivityChanged);
