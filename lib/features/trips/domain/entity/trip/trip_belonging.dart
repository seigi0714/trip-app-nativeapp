import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_name.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_num.dart';

part 'trip_belonging.freezed.dart';

@Freezed(copyWith: false, fromJson: false, toJson: false)
class TripBelonging with _$TripBelonging {
  const factory TripBelonging({
    required int id,
    required TripBelongingName name,
    required TripBelongingNum numOf,
    required bool isSharedAmongMember,
  }) = _TripBelonging;
}
