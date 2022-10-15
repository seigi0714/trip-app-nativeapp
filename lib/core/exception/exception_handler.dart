import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trip_app_nativeapp/core/exception/api_exception.dart';
import 'package:trip_app_nativeapp/features/auth/data/repositories/firebase_auth_repository.dart';

import '../constants/string.dart';
import '../scaffold_messenger.dart';

final exceptionHandler = Provider<ExceptionHandler>(ExceptionHandler.new);

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
    }
    _ref.read(scaffoldMessengerServiceProvider).showSnackBar(message);
  }

  void _handleApiException(ApiException e) {
    if (e.statusCode == HttpStatus.unauthorized) {
      _ref.read(firebaseAuthProvider).signOut();
    }
  }
}
