import 'package:flutter/material.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';

@immutable
class TripPeriod {
  TripPeriod({required this.fromDate, required this.endDate}) {
    if (fromDate.compareTo(endDate) == 1) {
      throw const AppException(
        code: ExceptionCode.invalidTripPeriod,
        message: '帰宅日が出発日過去より日付になっています。',
      );
    }
  }
  final DateTime fromDate;
  final DateTime endDate;
}
