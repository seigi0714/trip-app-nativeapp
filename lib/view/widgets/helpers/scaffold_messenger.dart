import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scaffold_messenger.g.dart';

@riverpod
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey(
  ScaffoldMessengerKeyRef ref,
) =>
    GlobalKey<ScaffoldMessengerState>();

@riverpod
ScaffoldMessengerHelper scaffoldMessengerHelper(
  ScaffoldMessengerHelperRef ref,
) =>
    ScaffoldMessengerHelper(ref);

/// ツリー上部の ScaffoldMessenger 上でスナックバーやダイアログの表示を操作する。
class ScaffoldMessengerHelper {
  ScaffoldMessengerHelper(this._ref);

  static const defaultSnackBarBehavior = SnackBarBehavior.floating;
  static const defaultSnackBarDuration = Duration(seconds: 3);

  final AutoDisposeProviderRef<ScaffoldMessengerHelper> _ref;

  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _ref.read(scaffoldMessengerKeyProvider);

  /// showDialog で指定したビルダー関数を返す。
  Future<T?> showDialogByBuilder<T>({
    required Widget Function(BuildContext) builder,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: scaffoldMessengerKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }

  /// showModalBottomSheet で指定したビルダー関数を返す。
  Future<T?> showModalBottomSheetByBuilder<T>({
    required Widget Function(BuildContext) builder,
  }) async {
    return showModalBottomSheet<T>(
      context: scaffoldMessengerKey.currentContext!,
      builder: builder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    );
  }

  /// スナックバーを表示する。
  void showSnackBar(
    String message, {
    bool removeCurrentSnackBar = true,
    Duration duration = defaultSnackBarDuration,
  }) {
    final scaffoldMessengerState = scaffoldMessengerKey.currentState!;
    if (removeCurrentSnackBar) {
      scaffoldMessengerState.removeCurrentSnackBar();
    }
    scaffoldMessengerState.showSnackBar(
      // TODO(shimizu-saffle): Theme でスタイルを指定する。
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        backgroundColor: Colors.white,
        behavior: defaultSnackBarBehavior,
        duration: duration,
      ),
    );
  }
}
