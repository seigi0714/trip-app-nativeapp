import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/data/repositories/trip_repository.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_invitation_num.dart';
import 'package:trip_app_nativeapp/features/trips/domain/repositories/trip_repository_interface.dart';

part 'trip_interactor.g.dart';

@riverpod
TripInteractor tripInteractor(TripInteractorRef ref) {
  return TripInteractor(
    tripRepo: ref.watch(tripRepositoryProvider),
  );
}

class TripInteractor {
  TripInteractor({
    required this.tripRepo,
  });

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

  Future<List<Trip>> fetchTrips(int userId) =>
      tripRepo.fetchTripsByUserId(userId);
}
