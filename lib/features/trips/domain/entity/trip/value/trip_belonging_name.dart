import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';

part 'trip_belonging_name.freezed.dart';

@Freezed(copyWith: false)
class TripBelongingName with _$TripBelongingName {
  factory TripBelongingName({required String value}) {
    if (value.isEmpty) {
      throw const AppException(
        code: ExceptionCode.invalidTripBelongingName,
        message: '持ち物名が空文字です',
      );
    }
    return TripBelongingName._internal(value: value);
  }
  factory TripBelongingName._internal({required String value}) =
      _TripBelongingName;
  static const minNum = 1;
}
