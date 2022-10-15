import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/string.dart';

final scaffoldMessengerKeyProvider =
    Provider((_) => GlobalKey<ScaffoldMessengerState>());

final scaffoldMessengerServiceProvider =
    Provider.autoDispose(ScaffoldMessengerService.new);

/// ツリー上部の ScaffoldMessenger 上でスナックバーやダイアログの表示を操作する。
class ScaffoldMessengerService {
  ScaffoldMessengerService(this._ref);

  static const defaultSnackBarBehavior = SnackBarBehavior.floating;
  static const defaultSnackBarDuration = Duration(seconds: 3);

  final AutoDisposeProviderRef<ScaffoldMessengerService> _ref;

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
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message, {
    bool removeCurrentSnackBar = true,
    Duration duration = defaultSnackBarDuration,
  }) {
    final scaffoldMessengerState = scaffoldMessengerKey.currentState!;
    if (removeCurrentSnackBar) {
      scaffoldMessengerState.removeCurrentSnackBar();
    }
    return scaffoldMessengerState.showSnackBar(
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

  /// Exception 起点でスナックバーを表示する。
  ///
  /// 開発者向けのメッセージを差し支えのないメッセージに置換してユーザーに表示する。
  ///
  /// デバッグモードでは、Exceptionのメッセージをそのまま表示する。
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBarByException(Exception e) {
    var message = generalExceptionMessage;
    if (kDebugMode) {
      message = e
          .toString()
          .replaceAll('Exception: ', '')
          .replaceAll('Exception', '');
    }
    return showSnackBar(message);
  }
}
