import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/data/repositories/trip_repository.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_invitation_num.dart';
import 'package:trip_app_nativeapp/features/trips/domain/repositories/trip_repository_interface.dart';
import 'package:trip_app_nativeapp/features/user/controller/app_user_controller.dart';
import 'package:trip_app_nativeapp/features/user/domain/entity/app_user.dart';

part 'trip_interactor.g.dart';

@riverpod
TripInteractor tripInteractor(TripInteractorRef ref) {
  return TripInteractor(
    loginUser: ref.watch(appUserControllerProvider).value!,
    tripRepo: ref.watch(tripRepositoryProvider),
  );
}

class TripInteractor {
  TripInteractor({
    required this.loginUser,
    required this.tripRepo,
  });

  /// ログイン中のユーザー
  final AppUser loginUser;
  final TripRepositoryInterface tripRepo;

  Future<void> createTrip(
    String title,
    DateTime fromDate,
    DateTime endDate,
  ) async {
    final trip = Trip.createNewTrip(
      title: title,
      fromDate: fromDate,
      endDate: endDate,
    );
    await tripRepo.createTrip(trip);
  }

  Future<GeneratedTripInvitation> invite({
    required int tripId,
    required int invitationNum,
  }) async {
    final tripInvitationNum = TripInvitationNum(value: invitationNum);
    final invitation = TripInvitation.createNewTripInvitation(
      tripId: tripId,
      invitationNum: tripInvitationNum,
    ) as NewTripInvitation;

    final result = await tripRepo.invite(invitation);
    return result;
  }

  /// ログイン中のユーザーが参加している旅行一覧を取得する
  Future<List<Trip>> fetchTrips() async {
    final result = await tripRepo.fetchTripsByUserId(loginUser.id);
    return result;
  }
}
