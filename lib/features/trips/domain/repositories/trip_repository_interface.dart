import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_belonging.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart';

abstract class TripRepositoryInterface {
  /// 旅データ作成
  Future<ExistingTrip> createTrip(NewTrip trip);

  /// 旅データ取得
  /// ユーザーが参加している旅データ一覧を取得する
  Future<List<ExistingTrip>> fetchTripsByUserId(int userId);

  /// 招待状作成
  Future<GeneratedTripInvitation> invite(
    NewTripInvitation invitation,
  );

  /// 招待コードから招待を取得
  Future<DetailTripInvitation> getInvitationByCode(
    String code,
  );

  /// 持ち物追加
  Future<AddedTripBelonging> addTripBelonging(
    int tripId,
    NewTripBelonging belonging,
  );

  /// 持ち物一覧取得
  Future<List<AddedTripBelonging>> fetchTripBelongings(
    int tripId,
  );
}
