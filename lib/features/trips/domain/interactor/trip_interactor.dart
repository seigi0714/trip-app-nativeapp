import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/features/trips/data/repositories/trip_repository.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_belonging.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_name.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_belonging_num.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_invitation_num.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_period.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/value/trip_title.dart';
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

  Future<ExistingTrip> createTrip(
    String title,
    DateTime fromDate,
    DateTime endDate,
  ) async {
    final trip = Trip.createNewTrip(
      title: TripTitle(value: title),
      period: TripPeriod(
        fromDate: fromDate,
        endDate: endDate,
      ),
    ) as NewTrip;
    return tripRepo.createTrip(trip);
  }

  Future<ExistingTrip> updateTrip(
    int id,
    String title,
    DateTime fromDate,
    DateTime endDate,
  ) {
    final trip = Trip.createExistingTrip(
      id: id,
      title: TripTitle(value: title),
      period: TripPeriod(
        fromDate: fromDate,
        endDate: endDate,
      ),
      // tripRepo.updateTrip では、メンバーと持ち物の更新はできないので、空の List を渡す。
      members: [],
      belongings: [],
    ) as ExistingTrip;
    return tripRepo.updateTrip(trip: trip);
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

  Future<List<ExistingTrip>> fetchTripsByUserId(int userId) =>
      tripRepo.fetchTripsByUserId(userId);

  Future<AddedTripBelonging> addTripBelonging({
    required int tripId,
    required String name,
    required int numOf,
    required bool isShareAmongMember,
  }) {
    final belonging = TripBelonging.createNewTripBelonging(
      name: TripBelongingName(value: name),
      numOf: TripBelongingNum(value: numOf),
      isShareAmongMember: isShareAmongMember,
    ) as NewTripBelonging;

    return tripRepo.addTripBelonging(tripId, belonging);
  }

  Future<List<AddedTripBelonging>> fetchTripBelongings(int tripId) =>
      tripRepo.fetchTripBelongings(tripId);

  Future<AddedTripBelonging> changeBelongingCheckStatus({
    required AddedTripBelonging belonging,
  }) async {
    final result = await tripRepo.changeBelongingCheckStatus(
      belongingId: belonging.id,
      isChecked: !belonging.isChecked,
    );
    return belonging.copyWith(isChecked: result);
  }
}
