import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_period.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_title.dart';

class Trip {
  Trip._({required this.title, required this.tripPeriod});

  // 新規作成時のfactory関数
  factory Trip.createNewTrip({
    required String title,
    required DateTime fromDate,
    required DateTime endDate,
  }) {
    return Trip._(
      title: TripTitle(title),
      tripPeriod: TripPeriod(
        fromDate: fromDate,
        endDate: endDate,
      ),
    );
  }

  final TripTitle title;
  final TripPeriod tripPeriod;
}
