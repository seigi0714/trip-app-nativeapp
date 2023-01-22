import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';

abstract class TripRepositoryInterface {
  /// 旅データ作成
  Future<Trip> createTrip(Trip trip);
}
