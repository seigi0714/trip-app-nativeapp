import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:trip_app_nativeapp/core/debug/logger.dart';
import 'package:trip_app_nativeapp/core/exception/api_exception.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/gen/assets.gen.dart';

class ErrorCat extends HookWidget {
  const ErrorCat(
    this.error,
    this.stackTrace, {
    super.key,
    this.message,
  });

  final Object error;
  final StackTrace? stackTrace;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final errorMessage = useState(''); // ユーザー向けのメッセージ
    final errorInfo = useState(''); // 開発者向けのエラー情報
    useEffect(
      () {
        if (kDebugMode) {
          logger.e(message, error, stackTrace);
        }
        if (error is ApiException) {
          final exception = error as ApiException;
          final description = exception.description ?? '';
          errorMessage.value = exception.message;
          errorInfo.value =
              description.isNotEmpty ? description : exception.errorCode;
        } else if (error is AppException) {
          final exception = error as AppException;
          errorMessage.value = exception.message ?? 'エラーが発生しました🙇‍♂️';
          errorInfo.value = exception.code ?? '';
        } else {
          errorMessage.value = 'エラーが発生しました🙇‍♂️';
        }
        return null;
      },
      [],
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.lotties.errorCat,
            height: context.displaySize.height * 0.32,
          ),
          Text(errorMessage.value),
          const Gap(16),
          Text(errorInfo.value)
        ],
      ),
    );
  }
}
