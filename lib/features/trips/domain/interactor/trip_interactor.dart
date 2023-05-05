import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/exception/api_exception.dart';
import 'package:trip_app_nativeapp/core/exception/app_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_code.dart';
import 'package:trip_app_nativeapp/features/trips/data/repositories/trip_repository.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_belonging.dart';
import 'package:trip_app_nativeapp/features/trips/domain/entity/trip/trip_invitation.dart';
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

  Future<void> createTrip(
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
    await tripRepo.createTrip(trip);
  }

  Future<GeneratedTripInvitation> invite({
    required int tripId,
  }) async {
    try {
      final invitation = TripInvitation.createNewTripInvitation(
        tripId: tripId,
        invitationNum: TripInvitationNum(),
      ) as NewTripInvitation;
      return tripRepo.invite(invitation);
    } on ApiException catch (e) {
      if (e.errorCode == ExceptionCode.invalidBase64Value ||
          e.errorCode == ExceptionCode.invalidEntityValue) {
        throw const InvalidInvitationCodeException();
      } else if (e.errorCode == ExceptionCode.inviteNumReachedLimit) {
        throw const InviteesReachedLimitException();
      } else if (e.errorCode == ExceptionCode.invitationExpired) {
        throw const InvitationExpiredException();
      }
      rethrow;
    }
  }

  Future<List<ExistingTrip>> fetchTripsByUserId(int userId) =>
      tripRepo.fetchTripsByUserId(userId);

  Future<List<AddedTripBelonging>> fetchTripBelongings(int tripId) =>
      tripRepo.fetchTripBelongings(tripId);
}
