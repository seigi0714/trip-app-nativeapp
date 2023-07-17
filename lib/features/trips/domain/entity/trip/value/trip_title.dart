import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_title.freezed.dart';

@Freezed(copyWith: false)
class TripTitle with _$TripTitle {
  factory TripTitle({required String value}) {
    assert(
      value.isNotEmpty,
      'UIのコードによって、空文字が入力されないように制御してください💡',
    );
    assert(
      value.length <= 25,
      'UIのコードによって、26文字以上の文字列が入力されないように制御してください💡',
    );
    return TripTitle._internal(value: value);
  }

  factory TripTitle._internal({required String value}) = _TripTitle;
}
