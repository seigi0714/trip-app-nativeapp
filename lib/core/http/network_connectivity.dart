import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/debug/logger.dart';

part 'network_connectivity.g.dart';

/// ネットワーク接続状態を ref.read したい場合に使う
@riverpod
Future<bool> isNetworkConnected(IsNetworkConnectedRef ref) async {
  final result = await Connectivity().checkConnectivity();
  return result != ConnectivityResult.none;
}

/// ネットワーク接続状態を ref.watch したい場合に使う
@Riverpod(keepAlive: true)
Stream<ConnectivityResult> networkConnectivity(
  NetworkConnectivityRef ref,
) {
  logger.i('NetworkConnectivity Changed');
  return Connectivity().onConnectivityChanged;
}
