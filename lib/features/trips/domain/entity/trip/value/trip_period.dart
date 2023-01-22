import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';

part 'trip_period.freezed.dart';

@Freezed(copyWith: false)
class TripPeriod with _$TripPeriod {
  factory TripPeriod({required DateTime fromDate, required DateTime endDate}) {
    if (fromDate.compareTo(endDate) == 1) {
      throw const AppException(
        code: ExceptionCode.invalidTripPeriod,
        message: '帰宅日が出発日過去より日付になっています。',
      );
    }
    return TripPeriod._internal(fromDate: fromDate, endDate: endDate);
  }
  factory TripPeriod._internal({
    required DateTime fromDate,
    required DateTime endDate,
  }) = _TripPeriod;
}
