import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_app_nativeapp/core/dynamic_links/dynamic_link_service.dart';
import 'package:trip_app_nativeapp/core/exception/api_exception.dart';
import 'package:trip_app_nativeapp/core/exception/exception_handler.dart';
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
    dynamicLinksService: ref.watch(dynamicLinksServiceProvider),
    exceptionHandler: ref.watch(exceptionHandlerProvider),
  );
}

class TripInteractor {
  TripInteractor({
    required this.tripRepo,
    required this.dynamicLinksService,
    required this.exceptionHandler,
  });

  final TripRepositoryInterface tripRepo;
  final DynamicLinksService dynamicLinksService;
  final ExceptionHandler exceptionHandler;

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

  Future<Uri> invite({
    required int tripId,
  }) async {
    try {
      final invitation = TripInvitation.createNewTripInvitation(
        tripId: tripId,
        invitationNum: TripInvitationNum(),
      ) as NewTripInvitation;
      final res = await tripRepo.invite(invitation);
      return dynamicLinksService.createInviteDynamicLink(res.invitationCode);
    } on ApiException catch (e) {
      throw exceptionHandler.convertApiExceptionToAppException(e);
    }
  }

  Future<List<ExistingTrip>> fetchTripsByUserId(int userId) =>
      tripRepo.fetchTripsByUserId(userId);

  Future<List<AddedTripBelonging>> fetchTripBelongings(int tripId) =>
      tripRepo.fetchTripBelongings(tripId);
}
