import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';

@freezed
class Trip with _$Trip {
  const factory Trip({
    required String title,
    required DateTime fromDate,
    required DateTime endDate,
  }) = _Trip;
}
