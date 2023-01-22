import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_period.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_title.dart';

part 'trip.freezed.dart';

@Freezed(copyWith: false, fromJson: false, toJson: false)
class Trip with _$Trip {
  const factory Trip({
    required TripTitle title,
    required TripPeriod tripPeriod,
  }) = _Trip;

  /// 新規作成時のfactory関数
  factory Trip.createNewTrip({
    required String title,
    required DateTime fromDate,
    required DateTime endDate,
  }) {
    return Trip(
      title: TripTitle(value: title),
      tripPeriod: TripPeriod(
        fromDate: fromDate,
        endDate: endDate,
      ),
    );
  }

  /// 作成済み旅エンティティのfactory関数
  /// 現状一緒だけどcreateNewTripと内容変わるはずなので定義しておく
  factory Trip.createExistingTrip({
    required String title,
    required DateTime fromDate,
    required DateTime endDate,
  }) {
    return Trip(
      title: TripTitle(value: title),
      tripPeriod: TripPeriod(
        fromDate: fromDate,
        endDate: endDate,
      ),
    );
  }
}
