import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/constants/string.dart';
import 'package:trip_app_nativeapp/core/exception/api_exception.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';
import 'package:trip_app_nativeapp/view/widgets/helpers/scaffold_messenger.dart';

part 'exception_handler.g.dart';

@riverpod
ExceptionHandler exceptionHandler(ExceptionHandlerRef ref) {
  return ExceptionHandler(ref);
}

class ExceptionHandler {
  ExceptionHandler(this._ref);
  final Ref _ref;

  void handleException(Exception e) {
    var message = generalExceptionMessage;
    if (kDebugMode) {
      message = e
          .toString()
          .replaceAll('Exception: ', '')
          .replaceAll('Exception', '');
    }

    if (e is ApiException) {
      _handleApiException(e);
      _ref.read(scaffoldMessengerHelperProvider).showSnackBar(e.message);
    } else if (e is AppException) {
      _ref.read(scaffoldMessengerHelperProvider).showSnackBar(
            e.toString(),
          );
    } else {
      _ref.read(scaffoldMessengerHelperProvider).showSnackBar(message);
    }
  }

  void _handleApiException(ApiException e) {
    if (e.statusCode == HttpStatus.unauthorized) {
      _ref.read(firebaseAuthProvider).signOut();
    }
  }
}
