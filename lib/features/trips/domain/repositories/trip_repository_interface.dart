import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart';

abstract class TripRepositoryInterface {
  /// 旅データ作成
  Future<Trip> createTrip(Trip trip);
  /// 招待状作成
  Future<GeneratedTripInvitation> invite(
    NewTripInvitation invitation,
  );
}
