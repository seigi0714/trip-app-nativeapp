import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';

part 'trip_belonging_num.freezed.dart';

@Freezed(copyWith: false)
class TripBelongingNum with _$TripBelongingNum {
  factory TripBelongingNum({required int value}) {
    if (minNum > value) {
      throw const AppException(
        code: ExceptionCode.invalidTripBelongingNum,
        message: '持ち物の個数を1個以上指定してください',
      );
    }
    return TripBelongingNum._internal(value: value);
  }
  factory TripBelongingNum._internal({required int value}) = _TripBelongingNum;
  static const minNum = 1;
}
