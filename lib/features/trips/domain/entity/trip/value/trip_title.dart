import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';

part 'trip_title.freezed.dart';

@Freezed(copyWith: false)
class TripTitle with _$TripTitle {
  factory TripTitle({required String value}) {
    if (value.isEmpty) {
      throw const AppException(
        code: ExceptionCode.invalidTripTitle,
        message: '旅のタイトルが空文字です🫢',
      );
    } else if (value.length > 25) {
      throw AppException(
        code: ExceptionCode.invalidTripTitle,
        message: '旅のタイトルは25文字以下にしてください。現在${value.length}文字です🙇‍♂️',
      );
    }
    return TripTitle._internal(value: value);
  }

  factory TripTitle._internal({required String value}) = _TripTitle;
}
