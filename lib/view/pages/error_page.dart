import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:trip_app_nativeapp/core/debug/logger.dart';
import 'package:trip_app_nativeapp/core/exception/api_exception.dart';
import 'package:trip_app_nativeapp/core/extensions/build_context.dart';
import 'package:trip_app_nativeapp/core/gen/assets.gen.dart';

class ErrorPage extends HookWidget {
  const ErrorPage({
    required this.exception,
    super.key,
  });

  static const path = '/error';
  static const name = 'ErrorPage';

  final Exception? exception;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        logger.e(exception);
        return null;
      },
      const [],
    );
    late String message;
    if (exception is ApiTimeoutException ||
        exception is NetworkNotConnectedException ||
        exception is SocketException) {
      message = 'ネットワーク接続をご確認ください😌';
    } else {
      message = 'エラーが発生しました。\nアプリの再起動をお試しください🙇‍♂️';
    }
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                Assets.lotties.errorCat,
                height: context.displaySize.height * 0.32,
              ),
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
}
