import 'package:flutter/material.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';

@immutable
class TripTitle {
  TripTitle(this.title) {
    if (title.isEmpty) {
      throw const AppException(
        code: ExceptionCode.invalidTripTitle,
        message: '旅のタイトルが空文字です。',
      );
    }
  }
  final String title;
}
