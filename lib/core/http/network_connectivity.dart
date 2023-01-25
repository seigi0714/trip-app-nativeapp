import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_connectivity.g.dart';

@riverpod
bool networkConnectivity(NetworkConnectivityRef ref) {
  return ref.watch(_networkConnectivityStream).value != ConnectivityResult.none;
}

final _networkConnectivityStream =
    StreamProvider((_) => Connectivity().onConnectivityChanged);
