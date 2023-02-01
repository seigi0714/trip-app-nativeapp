// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'network_connectivity.g.dart';

// /// ネットワーク接続状態を ref.read したい場合に使う
// @riverpod
// Future<bool> isNetworkConnected(IsNetworkConnectedRef ref) async {
//   final result = await Connectivity().checkConnectivity();
//   return result != ConnectivityResult.none;
// }

// /// ネットワーク接続状態を ref.watch したい場合に使う
// final networkConnectivityProvider =
//     StreamProvider((_) => Connectivity().onConnectivityChanged);
