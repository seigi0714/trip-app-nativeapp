import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';

part 'trip_title.freezed.dart';

@Freezed(copyWith: false)
class TripTitle with _$TripTitle {
  factory TripTitle({required String value}) {
    assert(
      value.length <= 25,
      'Widget のプロパティによる制御で、26文字以上の文字列が入力されないように制限してください💡',
    );

    if (value.isEmpty) {
      throw const AppException(
        code: ExceptionCode.invalidTripTitle,
        message: '旅のタイトルが空文字です🫢',
      );
    }
    return TripTitle._internal(value: value);
  }

  factory TripTitle._internal({required String value}) = _TripTitle;
}
