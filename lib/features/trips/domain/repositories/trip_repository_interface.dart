import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart';

abstract class TripRepositoryInterface {
  /// 旅データ作成
  Future<Trip> createTrip(Trip trip);

  /// 旅データ取得
  /// ユーザーが参加している旅データ一覧を取得する
  Future<List<Trip>> fetchTripsByUserId(int userId);

  /// 招待状作成
  Future<GeneratedTripInvitation> invite(
    NewTripInvitation invitation,
  );
  /// 招待コードから招待を取得
  Future<DetailTripInvitation> getInvitationByCode(
    String code,
  );
}
