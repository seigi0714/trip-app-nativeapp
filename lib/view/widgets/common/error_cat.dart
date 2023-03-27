import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:trip_app_nativeapp/core/debug/logger.dart';
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
    useEffect(
      () {
        if (kDebugMode) {
          logger.e(message, error, stackTrace);
        }
        return null;
      },
      [],
    );

    return Lottie.asset(
      Assets.lotties.errorCat,
      height: context.displaySize.height * 0.32,
    );
  }
}
